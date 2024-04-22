import 'package:bmi_app/modules/bmi_calculator/data/datasources/base_bmi_calculator_data_source.dart';
import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/base_bmi_calculator_repository.dart';

class BmiCalculatorRepository extends BaseBmiCalculatorRepository{
  final BaseBmiCalculatorDataSource _dataSource;

  BmiCalculatorRepository(this._dataSource);
  @override
  Stream<List<BmiCalculator>> getBmicalculationHistory() =>_dataSource.getBmicalculationHistory();
  
  @override
  Future<void> saveCurrentcalculation(BmiCalculator bmiCalculation) =>_dataSource.saveCurrentcalculation(bmiCalculation);
}