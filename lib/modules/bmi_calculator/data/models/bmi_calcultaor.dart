import 'package:uuid/uuid.dart';

class BmiCalculator {
  final double? age;
  final double? weight;
  final double? height;
  final String status;
  final String? id;
  BmiCalculator(
      {required this.age,
      required this.weight,
      required this.height,
      required this.status,
      this.id});

  Map<String, dynamic> toJson() => {
        if (age != null) 'age': age,
        if (height != null) 'weight': weight,
        if (weight != null) 'height': height,
        'status': status,
        'id': const Uuid().v4(),
        'CalculationTime': DateTime.now().millisecondsSinceEpoch
      };

  factory BmiCalculator.fromJson(Map<String, dynamic> json) => BmiCalculator(
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      status: json['status'],
      id: json['id']);
}
