part of 'cartoon_screen_bloc.dart';

class CartoonScreenState extends Equatable {
  const CartoonScreenState({
    this.cartoonList,
    this.isHasNetwork = true,
  });

  final List<FilmModel>? cartoonList;
  final bool isHasNetwork;

  CartoonScreenState copyWith({
    List<FilmModel>? cartoonList,
    bool? isHasNetwork,
  }) {
    return CartoonScreenState(
      cartoonList: cartoonList ?? this.cartoonList,
      isHasNetwork: isHasNetwork ?? this.isHasNetwork,
    );
  }

  @override
  List<Object?> get props => [cartoonList, isHasNetwork];
}
