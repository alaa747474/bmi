part of 'bmi_calculator_cubit.dart';

abstract class BmiCalculatorState {
  const BmiCalculatorState();

}

 class BmiCalculatorInitial extends BmiCalculatorState {}
 class CalculateBmiStatusSuccessState extends BmiCalculatorState {}
 class GetBmiStatusSuccessState extends BmiCalculatorState {}
 class EditBmiEntrySuccessState extends BmiCalculatorState {}
 class AssignEditValuesSuccessState extends BmiCalculatorState {}
