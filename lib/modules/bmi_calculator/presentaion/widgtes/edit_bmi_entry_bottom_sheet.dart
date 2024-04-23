import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_text_field.dart';
import '../../../../core/service/service_locator.dart';
import '../cubit/bmi_calculator_cubit.dart';

showEditBmiEntryBottomSheet(BuildContext context, BmiCalculator entry) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => BlocProvider.value(
      value: sl<BmiCalculatorCubit>(),
      child: BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
        buildWhen: (previous, current) => current is EditBmiEntrySuccessState,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                        controller: context
                            .read<BmiCalculatorCubit>()
                            .editAgeController,
                        hintText: "Age"),
                    CustomTextField(
                        controller: context
                            .read<BmiCalculatorCubit>()
                            .editHeightController,
                        hintText: "Height"),
                    CustomTextField(
                        controller: context
                            .read<BmiCalculatorCubit>()
                            .editWeightController,
                        hintText: "Weight"),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<BmiCalculatorCubit>()
                              .editBmiEntry(entry.id!);
                        },
                        child: const Text("Save"))
                  ],
                )),
          );
        },
      ),
    ),
  );
}