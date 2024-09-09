import 'package:flutter/material.dart';

import '../../common/appbar.dart';
import '../../constants/app_constants.dart';

class CartoonScreen extends StatefulWidget {
  const CartoonScreen({super.key});

  @override
  State<CartoonScreen> createState() => _CartoonScreenState();
}

class _CartoonScreenState extends State<CartoonScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        child: SimpleChildAppBar(titleAppBar: StringConstants.cartoon),
      ),
    );
  }
}
