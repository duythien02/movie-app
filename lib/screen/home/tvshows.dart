import 'package:flutter/material.dart';

import '../../common/appbar.dart';
import '../../constants/app_constants.dart';

class TvshowsScreen extends StatefulWidget {
  const TvshowsScreen({super.key});

  @override
  State<TvshowsScreen> createState() => _TvshowsScreenState();
}

class _TvshowsScreenState extends State<TvshowsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        child: SimpleChildAppBar(
          titleAppBar: StringConstants.shows,
        ),
      ),
    );
  }
}
