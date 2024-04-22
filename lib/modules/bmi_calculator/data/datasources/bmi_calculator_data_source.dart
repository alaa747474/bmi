import 'package:bmi_app/core/service/firestore_services.dart';
import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'base_bmi_calculator_data_source.dart';

class BmiCalculatorDataSource extends BaseBmiCalculatorDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;

  BmiCalculatorDataSource(this._firebaseFirestore, this._auth);
  @override
  Stream<List<BmiCalculator>> getBmicalculationHistory() {
    return _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("bmihistory").orderBy("CalculationTime")
        .snapshots()
        .map((event) {
      return event.docs.map((e) => BmiCalculator.fromJson(e.data())).toList();
    });
  }

  @override
  Future<void> saveCurrentcalculation(BmiCalculator bmiCalculation) async {
    await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("bmihistory")
        .add(bmiCalculation.toJson());
  }
}
