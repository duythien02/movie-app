import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/bloc/main_home/main_home_bloc.dart';

import '../constants/app_constants.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen>
    with TickerProviderStateMixin {
  final _mainHomeBloc = MainHomeBloc();

  @override
  void initState() {
    super.initState();
    _mainHomeBloc.screenController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          return;
        }
      },
      child: BlocProvider(
        create: (context) => _mainHomeBloc,
        child: BlocBuilder<MainHomeBloc, MainHomeState>(
          bloc: _mainHomeBloc,
          builder: (context, state) {
            return Scaffold(
              body: TabBarView(
                controller: _mainHomeBloc.screenController,
                physics: const NeverScrollableScrollPhysics(),
                children: _mainHomeBloc.listScreen,
              ),
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: const Color(ColorConstants.lightOrange),
                  onTap: (index) {
                    _mainHomeBloc.add(ChangeScreen(index: index));
                  },
                  currentIndex: state.index,
                  unselectedLabelStyle: TextStyle(fontSize: 12.sp),
                  selectedLabelStyle: TextStyle(fontSize: 12.sp),
                  selectedItemColor: const Color(ColorConstants.primaryOrange),
                  unselectedItemColor: const Color(ColorConstants.gray),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Trang chủ',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Yêu thích',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
