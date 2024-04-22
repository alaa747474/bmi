import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.1),
                          spreadRadius: 4,
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
                      ]),
                ),
              ),
            ),
            body: IndexedStack(
              index: context.read<LayoutCubit>().currentIndex,
              children: context.read<LayoutCubit>().screens,
            ),
          );
        },
      ),
    );
  }
}
