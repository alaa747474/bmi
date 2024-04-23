import 'package:bmi_app/modules/bmi_calculator/data/models/bmi_calcultaor.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/cubit/bmi_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiEntryCard extends StatelessWidget {
  const BmiEntryCard({super.key, required this.bmi});
  final BmiCalculator bmi;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Entry",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<BmiCalculatorCubit>()
                                  .assignCurrentValuesToEditEntry(bmi);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                      ],
                    );
                  },
                )
              ],
            ),
            RowDataItem(title: "Age", value: "${bmi.age} Years"),
            RowDataItem(title: "Height", value: "${bmi.height} Cm"),
            RowDataItem(title: "Weight", value: "${bmi.weight} Kg"),
            RowDataItem(title: "Status", value: "${bmi.status} "),
          ],
        ));
  }
}

class RowDataItem extends StatelessWidget {
  const RowDataItem({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}


