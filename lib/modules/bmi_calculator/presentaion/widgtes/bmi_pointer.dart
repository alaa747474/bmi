import 'package:bmi_app/modules/bmi_calculator/presentaion/cubit/bmi_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiPointer extends StatelessWidget {
  const BmiPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
      buildWhen: (previous, current) =>
          current is CalculateBmiStatusSuccessState,
      builder: (context, state) {
        return SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
            GaugeRange(
                rangeOffset: -18,
                label: "Underweight",
                labelStyle: const GaugeTextStyle(color: Colors.white),
                startValue: 0,
                endValue: 18.5,
                color: Theme.of(context).primaryColor,
                startWidth: 25.w,
                endWidth: 25.w),
            GaugeRange(
                label: "Normal",
                rangeOffset: -18,
                startValue: 18.5,
                endValue: 25,
                color: Colors.orange,
                startWidth: 25.w,
                endWidth: 25.w),
            GaugeRange(
                label: "overweight",
                rangeOffset: -18,
                startValue: 25,
                endValue: 40,
                color: Colors.red,
                startWidth: 25.w,
                endWidth: 25.w)
          ], pointers: <GaugePointer>[
            NeedlePointer(
                value: context.read<BmiCalculatorCubit>().currentBmiRate)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(
                    'BMI = ${context.read<BmiCalculatorCubit>().currentBmiRate}',
                    style: Theme.of(context).textTheme.titleMedium),
                angle: 90,
                positionFactor: 0.7)
          ])
        ]);
      },
    );
  }
}
