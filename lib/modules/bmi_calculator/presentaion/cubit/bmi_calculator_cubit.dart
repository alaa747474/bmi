import 'dart:math' as math;
import 'package:bloc/bloc.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/base_bmi_calculator_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/models/bmi_calcultaor.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  BmiCalculatorCubit(this._repository) : super(BmiCalculatorInitial());
  final BaseBmiCalculatorRepository _repository;
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController editAgeController = TextEditingController();
  TextEditingController editWeightController = TextEditingController();
  TextEditingController editHeightController = TextEditingController();

  String status = "";
  double currentBmiRate = 0;
  Query<Object?> getBmicalculationHistory() {
    return _repository.getBmiEntriesHistory();
  }

  void saveCurrentBmiEntry(String id) {
    _repository.saveCurrentBmiEntry(BmiCalculator(
        id: id,
        age: double.parse(ageController.text),
        weight: double.parse(weightController.text),
        height: double.parse(heightController.text),
        status: status));
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

  void editBmiEntry(String id) {
    currentBmiRate = (double.parse(editWeightController.text) /
        math.pow((double.parse(editHeightController.text) / 100), 2));
    currentBmiRate = double.parse(currentBmiRate.toStringAsFixed(1));
    getBmiStatus(currentBmiRate);
    _repository
        .editBmiEntry(BmiCalculator(
            id: id,
            age: double.parse(editAgeController.text),
            weight: double.parse(editWeightController.text),
            height: double.parse(editHeightController.text),
            status: status))
        .then((value) => emit(EditBmiEntrySuccessState()));
  }

  void assignCurrentValuesToEditEntry(BmiCalculator entry) {
    editAgeController.text = entry.age.toString();
    editWeightController.text = entry.weight.toString();
    editHeightController.text = entry.height.toString();
    emit(AssignEditValuesSuccessState());
  }

  bool checkIfAnyFieldsEmypty() {
    if (ageController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  
  }
}
