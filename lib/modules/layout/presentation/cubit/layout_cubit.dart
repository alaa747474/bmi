import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import '../../../bmi_calculator/presentaion/screens/bmi_calculator_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  int currentIndex=0;
  List<Widget>screens=[BmiCalculatorScreen(),BmiCalculatorScreen()];
  void changeIndex(int index){
    currentIndex =index;
    emit(ChangeBottomNavBarIndex());
  }
}
