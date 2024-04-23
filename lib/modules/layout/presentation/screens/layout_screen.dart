import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        buildWhen: (previous, current) => current is ChangeBottomNavBarIndex,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.1),
                          spreadRadius: 14,
                          blurRadius: 20),
                    ],
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(80)),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                      selectedItemColor: Theme.of(context).primaryColor,
                      unselectedItemColor: Colors.grey[700],
                      landscapeLayout:
                          BottomNavigationBarLandscapeLayout.centered,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onTap: (value) {
                        context.read<LayoutCubit>().changeIndex(value);
                      },
                      currentIndex: context.read<LayoutCubit>().currentIndex,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: "Home"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.history), label: "History"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: "Settings"),
                      ]),
                ),
              ),
            ),
            body:
             IndexedStack(
              index: context.read<LayoutCubit>().currentIndex,
              children: context.read<LayoutCubit>().screens,
            ),
          );
        },
      ),
    );
  }
}
