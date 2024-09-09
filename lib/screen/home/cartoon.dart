import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cartoon_screen/cartoon_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/list_film.dart';
import '../../constants/app_constants.dart';

class CartoonScreen extends StatefulWidget {
  const CartoonScreen({super.key});

  @override
  State<CartoonScreen> createState() => _CartoonScreenState();
}

class _CartoonScreenState extends State<CartoonScreen> {
  final _cartoonBloc = CartoonScreenBloc();

  @override
  void initState() {
    super.initState();
    _cartoonBloc.add(const InitCartoonScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cartoonBloc,
      child: BlocBuilder<CartoonScreenBloc, CartoonScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(
              child: SimpleChildAppBar(titleAppBar: StringConstants.cartoon),
            ),
            body: ListFilm(
              isHasNetwork: state.isHasNetwork,
              listFilm: state.cartoonList,
              refresh: () {
                _cartoonBloc.add(const InitCartoonScreen());
                _cartoonBloc.refreshController.refreshCompleted();
              },
              loadMore: () {
                _cartoonBloc.add(const LoadMoreCartoon());
              },
              refreshController: _cartoonBloc.refreshController,
            ),
          );
        },
      ),
    );
  }
}
