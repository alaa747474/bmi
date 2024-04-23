import 'package:bmi_app/core/components/custom_text_field.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/widgtes/bmi_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bmi"),
      ),
      body: BlocConsumer<BmiCalculatorCubit, BmiCalculatorState>(
        listener: (context, state) {
          if (state is CalculateBmiStatusSuccessState) {
            context.read<BmiCalculatorCubit>().saveCurrentBmiEntry(const Uuid().v4());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: 4.h,
                  ),
                  const BmiPointer(),
                  CustomTextField(
                      controller:
                          context.read<BmiCalculatorCubit>().ageController,
                      hintText: "Age"),
                  SizedBox.square(
                    dimension: 16.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextField(
                            controller: context
                                .read<BmiCalculatorCubit>()
                                .heightController,
                            hintText: "Height"),
                      ),
                      SizedBox.square(
                        dimension: 8.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomTextField(
                            controller: context
                                .read<BmiCalculatorCubit>()
                                .weightController,
                            hintText: "Weight"),
                      ),
                    ],
                  ),
                  SizedBox.square(
                    dimension: 32.h,
                  ),
                  ElevatedButton(
                      onPressed: context.read<BmiCalculatorCubit>().checkIfAnyFieldsEmypty()?null: () {
                        context.read<BmiCalculatorCubit>().calculateBmiRate();
                      },
                      child: const Text("Calculate"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
