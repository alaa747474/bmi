part of 'bmi_calculator_cubit.dart';

abstract class BmiCalculatorState {
  const BmiCalculatorState();

}

 class BmiCalculatorInitial extends BmiCalculatorState {}
 class CalculateBmiStatusSuccessState extends BmiCalculatorState {}
 class GetBmiStatusSuccessState extends BmiCalculatorState {}
