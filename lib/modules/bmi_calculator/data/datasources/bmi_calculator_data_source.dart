import 'dart:developer';

import 'package:bmi_app/core/constants/firestore_collections.dart';
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
      .orderBy("CalculationTime", descending: true);

  @override
  Future<void> saveCurrentBmiEntry(BmiCalculator bmiCalculation) async {
    await _firebaseFirestore
        .collection(FirestoreCollections.instance.users)
        .doc(_auth.currentUser!.uid)
        .collection(FirestoreCollections.instance.bmiEntriesHistory)
        .add(bmiCalculation.toJson());
  }

  @override
  Future<void> editBmiEntry(BmiCalculator entry) async {
    _firebaseFirestore
        .collection(FirestoreCollections.instance.users)
        .doc(_auth.currentUser!.uid)
        .collection(FirestoreCollections.instance.bmiEntriesHistory)
        .where("id", isEqualTo: entry.id)
        .get()
        .then((value) {
      for (var element in value.docs) {
        log("Id  ====>  ${element.id} ========== ENTRY ID ${entry.id}");
        log("DOCS  ====>  $element");
        _firebaseFirestore
            .collection(FirestoreCollections.instance.users)
            .doc(_auth.currentUser!.uid)
            .collection(FirestoreCollections.instance.bmiEntriesHistory)
            .doc(element.id)
            .update(entry.toJson());
      }
    });
  }
}
