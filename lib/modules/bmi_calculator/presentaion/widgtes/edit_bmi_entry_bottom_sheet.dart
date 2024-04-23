import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_text_field.dart';
import '../cubit/bmi_calculator_cubit.dart';

showEditBmiEntryBottomSheet(BuildContext context, BmiCalculator entry) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
      buildWhen: (previous, current) => current is EditBmiEntrySuccessState,
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              padding: EdgeInsets.all(12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Edit Bmi Entry",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  CustomTextField(
                      controller:
                          context.read<BmiCalculatorCubit>().editAgeController,
                      hintText: "Age"),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                      controller: context
                          .read<BmiCalculatorCubit>()
                          .editHeightController,
                      hintText: "Height"),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                      controller: context
                          .read<BmiCalculatorCubit>()
                          .editWeightController,
                      hintText: "Weight"),
                  SizedBox(
                    height: 32.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<BmiCalculatorCubit>()
                            .editBmiEntry(entry.id!);
                      },
                      child: const Text("Save")),
                  SizedBox(
                    height: 32.h,
                  ),
                ],
              )),
        );
      },
    ),
  );
}
