import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';

abstract class BaseBmiCalculatorRepository {
  Stream<List<BmiCalculator>>getBmicalculationHistory();
   Future<void>saveCurrentcalculation(BmiCalculator bmiCalculation);
}