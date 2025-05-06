import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/home/domain/use_cases/wishlist_use_case.dart';
import 'package:lms_system/features/home/presentation/bloc/home_event.dart';

import 'wishlist_state.dart';

class WishlistBloc extends Bloc<HomeEvent, WishlistState> {
  final WishlistUseCase wishlistUseCase;

  WishlistBloc(this.wishlistUseCase) : super(WishlistInitial()) {
    on<GetWishlistEvent>(onGetWishlist);
  }

  Future<void> onGetWishlist(event, emit) async {
    emit(WishlistLoading());
    try {
      final wishlist = await wishlistUseCase(
        limit: event.limit,
        categoryId: event.categoryId,
      );
      emit(WishlistLoaded(wishlistResponse: wishlist));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }
}
