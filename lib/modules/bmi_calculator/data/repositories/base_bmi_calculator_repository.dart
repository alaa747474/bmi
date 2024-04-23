import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseBmiCalculatorRepository {
   Query<Object?>getBmiEntriesHistory();
   Future<void>saveCurrentBmiEntry(BmiCalculator bmiCalculation);
   Future<void>editBmiEntry(BmiCalculator entry);
}