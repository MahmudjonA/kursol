import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:logger/logger.dart';

import '../colors/app_colors.dart';
import 'course_completion_dialog_wg.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final bool autoplay; // Optional parameter to control autoplay behavior

  const CustomVideoPlayer({
    super.key,
    required this.videoUrl,
    this.autoplay = false, // Default to false to prevent autoplay
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoController;
  bool _isFullScreen = false;
  bool _isLoading = true;
  bool _hasError = false;
  bool _controlsVisible = true;
  bool _dialogShown = false;
  bool _isPlaying = false;
  bool _isBuffering = false;
  Timer? _hideControlsTimer;
  final Logger _logger = Logger();

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              _isLoading = false;
              _hasError = false;
            });
            // Only autoplay if explicitly requested
            if (widget.autoplay) {
              _togglePlayPause();
            }
          }
        }).catchError((error) {
          _logger.e("Video loading error", error: error);
          if (mounted) {
            setState(() {
              _hasError = true;
              _isLoading = false;
            });
          }
        });

      _videoController.addListener(_videoListener);
    } catch (e) {
      _logger.e("Video initialization error", error: e);
      if (mounted) {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    }
  }

  void _videoListener() {
    if (!mounted) return;

    // Update buffering state
    if (_videoController.value.isBuffering != _isBuffering) {
      setState(() {
        _isBuffering = _videoController.value.isBuffering;
      });
    }

    // Update playing state
    if (_videoController.value.isPlaying != _isPlaying) {
      setState(() {
        _isPlaying = _videoController.value.isPlaying;
      });
    }

    // Show completion dialog when video ends
    if (_videoController.value.position >= _videoController.value.duration &&
        !_dialogShown &&
        _videoController.value.duration > Duration.zero) {
      _dialogShown = true;
      // _showCompletionDialog();
    }
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _videoController.removeListener(_videoListener);
    _videoController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _isPlaying) { // Only hide if video is playing
        setState(() {
          _controlsVisible = false;
        });
      }
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  // void _showCompletionDialog() {
  //   if (mounted) {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return CourseCompletionDialog(
  //           onSubmit: () {
  //             Navigator.pop(context);
  //           },
  //           onCancel: () {
  //             Navigator.pop(context);
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  void _toggleControls() {
    setState(() {
      _controlsVisible = !_controlsVisible;
    });
    if (_controlsVisible) {
      _startHideControlsTimer();
    }
  }

  void _togglePlayPause() {
    if (!_videoController.value.isInitialized) return;

    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying ? _videoController.play() : _videoController.pause();
    });
    _startHideControlsTimer();
  }

  void _seekForward() {
    if (!_videoController.value.isInitialized) return;

    final newPosition = _videoController.value.position + const Duration(seconds: 10);
    _videoController.seekTo(
      newPosition < _videoController.value.duration ? newPosition : _videoController.value.duration,
    );
  }

  void _seekBackward() {
    if (!_videoController.value.isInitialized) return;

    final newPosition = _videoController.value.position - const Duration(seconds: 10);
    _videoController.seekTo(
      newPosition > Duration.zero ? newPosition : Duration.zero,
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return duration.inHours > 0 ? "$hours:$minutes:$seconds" : "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleControls,
      onDoubleTapDown: (details) {
        if (details.globalPosition.dx < MediaQuery.of(context).size.width / 2) {
          _seekBackward();
        } else {
          _seekForward();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Video player
          Center(
            child: _hasError
                ? _buildErrorWidget()
                : _isLoading
                ? _buildLoadingIndicator()
                : _videoController.value.isInitialized
                ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            )
                : _buildLoadingIndicator(),
          ),

          // Buffering indicator
          // if (_isBuffering) _buildBufferingIndicator(),

          // Play button overlay when paused
          if (!_isPlaying &&
              !_isLoading &&
              !_hasError &&
              _videoController.value.isInitialized)

          //
          // Controls
          if (_controlsVisible) _buildControls(),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 50),
          const SizedBox(height: 16),
          const Text(
            "Video loading failed",
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Please check your internet connection and try again",
            style: TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
                _hasError = false;
              });
              _initializeVideo();
            },
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: Colors.white),
        SizedBox(height: 16),
        Text(
          "Loading video...",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  // Widget _buildBufferingIndicator() {
  //   return const Center(
  //     child: CircularProgressIndicator(color: Colors.white),
  //   );
  // }

  // Widget _buildPlayButtonOverlay() {
  //   return GestureDetector(
  //     onTap: _togglePlayPause,
  //     child: Container(
  //       color: Colors.black38,
  //       child: Center(
  //         child: Icon(
  //           Icons.play_arrow,
  //           size: 60,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildControls() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
          ),
        ),
        child:
            Column(
              children: [
                // Верхняя панель с временем и кнопкой полноэкранного режима
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      // Время, выровненное по центру
                      Expanded(
                        child: Center(
                          child: Text(
                            _formatDuration(_videoController.value.position),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // Кнопка полноэкранного режима
                      IconButton(
                        icon: Icon(
                          _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                          color: Colors.white,
                        ),
                        onPressed: _toggleFullScreen,
                      ),
                    ],
                  ),
                ),
                // Spacer для отделения времени и кнопок управления
                const Spacer(),
                // Нижняя панель с кнопками управления (пауза, перемотка вперёд и назад)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Кнопка перемотки назад
                      IconButton(
                        icon: const Icon(Icons.replay_10, size: 32),
                        color: Colors.white,
                        onPressed: _seekBackward,
                      ),
                      const SizedBox(width: 20), // Отступ между кнопками
                      // Кнопка play/pause
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                        ),
                        color: Colors.white,
                        onPressed: _togglePlayPause,
                      ),
                      const SizedBox(width: 20),
                      // Кнопка перемотки вперёд
                      IconButton(
                        icon: const Icon(Icons.forward_10, size: 32),
                        color: Colors.white,
                        onPressed: _seekForward,
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}