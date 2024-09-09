import 'package:flutter/material.dart';

import '../../common/appbar.dart';
import '../../constants/app_constants.dart';

class SeriesFilmScreen extends StatefulWidget {
  const SeriesFilmScreen({super.key});

  @override
  State<SeriesFilmScreen> createState() => _SeriesFilmScreenState();
}

class _SeriesFilmScreenState extends State<SeriesFilmScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        child: SimpleChildAppBar(
          titleAppBar: StringConstants.series,
        ),
      ),
    );
  }
}
