import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../api/api_app.dart';
import '../../helper/network_helper.dart';
import '../../models/film_model.dart';

part 'cartoon_screen_event.dart';
part 'cartoon_screen_state.dart';

class CartoonScreenBloc extends Bloc<CartoonScreenEvent, CartoonScreenState> {
  int page = 1;
  RefreshController refreshController = RefreshController();

  CartoonScreenBloc() : super(const CartoonScreenState()) {
    on<InitCartoonScreen>(_onInitCartoonScreen);
    on<LoadMoreCartoon>(_onLoadMoreCartoon);
  }

  Future<void> _onInitCartoonScreen(
      InitCartoonScreen event, Emitter<CartoonScreenState> emit) async {
    emit(state.copyWith(isHasNetwork: true));
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    final bool hasNetwork = await NetworkHelper.checkNetwork();
    if (!hasNetwork) {
      emit(
        state.copyWith(
          isHasNetwork: false,
        ),
      );
    } else {
      //reset page
      page = 1;
      emit(
        state.copyWith(
          isHasNetwork: true,
          cartoonList: [],
        ),
      );
      final listCartoon = await HandleResponseApi.handleApiListCartoon(
        page: page,
        limit: 12,
      );
      emit(
        state.copyWith(
          cartoonList: listCartoon,
        ),
      );
    }
  }

  Future<void> _onLoadMoreCartoon(
      LoadMoreCartoon event, Emitter<CartoonScreenState> emit) async {
    final listMoreCartoon = await HandleResponseApi.handleApiListCartoon(
      page: ++page,
      limit: 12,
    );
    if (listMoreCartoon.isEmpty) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
      emit(
        state.copyWith(
          cartoonList: [...state.cartoonList!, ...listMoreCartoon],
        ),
      );
    }
  }
}
