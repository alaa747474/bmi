
import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'base_bmi_calculator_data_source.dart';

class BmiCalculatorDataSource extends BaseBmiCalculatorDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;

  BmiCalculatorDataSource(this._firebaseFirestore, this._auth);
  @override
  Query<Object?> getBmicalculationHistory() => _firebaseFirestore
      .collection("users")
      .doc(_auth.currentUser!.uid)
      .collection("bmihistory")
      .orderBy("CalculationTime");

  @override
  Future<void> saveCurrentBmiEntry(BmiCalculator bmiCalculation) async {
    await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("bmihistory")
        .add(bmiCalculation.toJson());
  }

  @override
  Future<void> editBmiEntry(BmiCalculator entry) async {
    var query = _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("bmihistory")
        .where("id", isEqualTo: entry.id);
  await  query.get().then((value) {
      for (var element in value.docs) {
        _firebaseFirestore
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .collection("bmihistory")
            .doc(element.id)
            .update(entry.toJson());
      }
    });
  }
}
