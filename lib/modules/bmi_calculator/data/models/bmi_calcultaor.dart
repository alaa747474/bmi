class BmiCalculator {
  final double age;
  final double weight;
  final double height;
  final String status;
  BmiCalculator(this.age, this.weight, this.height, this.status);

  Map<String, dynamic> toJson() =>
      {'age': age, 'weight': weight, 'height': height,'status':status,'CalculationTime':DateTime.now().millisecondsSinceEpoch};

  factory BmiCalculator.fromJson(Map<String, dynamic> json) => BmiCalculator(
        json['age'],
        json['weight'],
        json['height'],
        json['status'],
      );
}
