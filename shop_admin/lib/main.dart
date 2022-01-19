// ignore_for_file: prefer_const_constructors

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_admin/screens/category_screen.dart';
import 'package:shop_admin/screens/main_category_screen.dart';
import 'package:shop_admin/screens/sub_category_screen.dart';

import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Admin',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SideMenu(),
    );
  }
}

class SideMenu extends StatefulWidget {
  static const String id = 'side-menu';
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Widget _selectedScreen = DashBoardScreen();
  // lựa chọn click mục nào hiện mục đó
  screenSelector(item) {
    switch(item.route){
      case DashBoardScreen.id:
      setState(() {
        _selectedScreen=const DashBoardScreen();
      });
      break;
      case CategoryScreen.id:
      setState(() {
        _selectedScreen=const CategoryScreen();
      });
      break;
      case MainCategoryScreen.id:
      setState(() {
        _selectedScreen= const MainCategoryScreen();
      });
      break;
      case SubCategoryScreen.id:
      setState(() {
        _selectedScreen= const SubCategoryScreen();
      });
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'HỆ THỐNG QUẢN LÝ APP',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      sideBar: SideBar(
        items: const [
          MenuItem(
            title: 'Trang chủ',
            route: DashBoardScreen.id,
            icon: Icons.dashboard,
          ),
          MenuItem(
            title: 'Các Danh mục',
            icon: IconlyLight.category,
            children: [
              MenuItem(
                title: 'Danh mục',
                route: CategoryScreen.id,
              ),
              MenuItem(
                title: 'Main Category',
                route: MainCategoryScreen.id,
              ),
              MenuItem(
                title: 'Sub Category',
                route: SubCategoryScreen.id,
              ),
            ],
          ),
        ],
        selectedRoute: SideMenu.id,
        onSelected: (item) {
          screenSelector(item);
          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: Color(0xff444444),
          child: const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: Color(0xff444444),
          child: Center(
            child: Text(
              '${DateTimeFormat.format(DateTime.now(), format: AmericanDateFormats.dayOfWeek)}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _selectedScreen,
      ),
    );
  }
}
