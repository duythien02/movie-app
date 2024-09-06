import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.keyWord});
  final String keyWord;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.keyWord);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
