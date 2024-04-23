import 'package:bmi_app/modules/bmi_calculator/data/datasources/base_bmi_calculator_data_source.dart';
import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/base_bmi_calculator_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BmiCalculatorRepository extends BaseBmiCalculatorRepository{
  final BaseBmiCalculatorDataSource _dataSource;

  BmiCalculatorRepository(this._dataSource);
  @override
  Query<Object?> getBmiEntriesHistory() =>_dataSource.getBmicalculationHistory();
  
  @override
  Future<void> saveCurrentBmiEntry(BmiCalculator bmiCalculation) =>_dataSource.saveCurrentBmiEntry(bmiCalculation);
  
  @override
  Future<void> editBmiEntry(BmiCalculator entry) =>_dataSource.editBmiEntry(entry);
}