import 'package:flutter/material.dart';

import '../../common/appbar.dart';
import '../../constants/app_constants.dart';

class NewestFilmScreen extends StatefulWidget {
  const NewestFilmScreen({super.key});

  @override
  State<NewestFilmScreen> createState() => _NewestFilmScreenState();
}

class _NewestFilmScreenState extends State<NewestFilmScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        child: SimpleChildAppBar(
          titleAppBar: StringConstants.newestFilm,
        ),
      ),
    );
  }
}
