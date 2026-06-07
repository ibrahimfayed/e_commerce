import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/cart/presentation/screen/cart_tab.dart';
import 'package:e_commerce/features/categories/presentation/screen/categories_tab.dart';
import 'package:e_commerce/features/home/presentation/screen/home_tab.dart';
import 'package:e_commerce/features/profile/presentation/screen/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int curPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtomNavBar(
        onTap: (value) {
          curPage = value;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: LazyIndexedStack(
          index: curPage,
          children: [HomeTab(), CategoriesTab(), CartTab(), ProfileTab()],
        ),
      ),
    );
  }
}
