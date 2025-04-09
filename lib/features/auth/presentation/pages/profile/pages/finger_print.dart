import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';
import '../widgets/show_succes_dialog.dart';

class Fingerprint extends StatefulWidget {
  const Fingerprint({super.key});

  @override
  State<Fingerprint> createState() => _FingerprintState();
}

class _FingerprintState extends State<Fingerprint> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    bool canCheck = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();

    if (!mounted) return;

    setState(() {
      _isAvailable = canCheck && isDeviceSupported;
    });
  }

  Future<void> _authenticate() async {
    if (!_isAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Biometrik autentifikatsiya qo‘llab-quvvatlanmaydi!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Iltimos, barmog‘ingizni skanerga qo‘ying.',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );

      if (!mounted) return;
      if (authenticated == true) {
        showSuccessDialog(context);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authenticated
                ? "Fingerprint tasdiqlandi!"
                : "Tasdiqlash muvaffaqiyatsiz.",
          ),
          backgroundColor: authenticated ? Colors.green : Colors.red,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Xatolik: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          // context.go(RoutePaths.createNewPin);
          Navigator.pop(context);
        },
        titleText: "Set Fingerprint",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: appH(76),
          children: [
            Text(
              "Add a fingerprint",
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist.regular(
                color: AppColors.greyScale.grey900,
                fontSize: 18,
              ),
            ),
            Image.asset(
              "assets/images/fingerprint.png",
              height: appH(236),
              width: appW(228),
            ),
            Text(
              "Please put your finger on the fingerprint scanner to get started.",
              textAlign: TextAlign.center,
              style: AppTextStyles.urbanist.regular(
                color: AppColors.greyScale.grey900,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary.blue100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                    onPressed: () => showSuccessDialog(context),
                    child: Text(
                      "Skip",
                      style: AppTextStyles.urbanist.bold(
                        color: AppColors.primary.blue500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: appW(12)),
                Expanded(
                  child: DefaultButtonWg(
                    title: "Continue",
                    onPressed: () {
                      _authenticate();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
