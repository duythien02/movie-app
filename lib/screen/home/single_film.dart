import 'package:flutter/material.dart';

import '../../common/appbar.dart';
import '../../constants/app_constants.dart';

class SingleFilmScreen extends StatefulWidget {
  const SingleFilmScreen({super.key});

  @override
  State<SingleFilmScreen> createState() => _SingleFilmScreenState();
}

class _SingleFilmScreenState extends State<SingleFilmScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        child: SimpleChildAppBar(
          titleAppBar: StringConstants.singleFilm,
        ),
      ),
    );
  }
}
