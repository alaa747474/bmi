import 'dart:math' as math;
import 'package:bloc/bloc.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/base_bmi_calculator_repository.dart';
import 'package:flutter/material.dart';

import '../../data/models/bmi_calcultaor.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  BmiCalculatorCubit(this._repository) : super(BmiCalculatorInitial());
  final BaseBmiCalculatorRepository _repository;
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  Stream<List<BmiCalculator>> getBmicalculationHistory() {
    return _repository.getBmicalculationHistory();
  }

  String status = "";
  double currentBmiRate = 0;
  void saveCalculation() {
    _repository.saveCurrentcalculation(BmiCalculator(
        double.parse(ageController.text),
        double.parse(weightController.text),
        double.parse(heightController.text),
        status));
  }

  void calculateBmiRate() {
    currentBmiRate = (double.parse(weightController.text) /
        math.pow((double.parse(heightController.text) / 100), 2));
    currentBmiRate = double.parse(currentBmiRate.toStringAsFixed(1));
    emit(CalculateBmiStatusSuccessState());
    getBmiStatus(currentBmiRate);
  }

  void getBmiStatus(double rate) {
    switch (rate) {
      case <= 18:
        status = "underweight";
      case < 25 && > 18:
        status = "Normal";
      case < 40 && >= 25:
        status = "overweight";
      default:
        status = "obesity";
    }
    emit(GetBmiStatusSuccessState());
  }
}
