import 'package:bmi_app/core/components/loading_indicator.dart';
import 'package:bmi_app/core/service/service_locator.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/widgtes/bmi_entry_card.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/widgtes/edit_bmi_entry_bottom_sheet.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/bmi_calcultaor.dart';
import '../cubit/bmi_calculator_cubit.dart';

class BmiEntriesHistory extends StatelessWidget {
  const BmiEntriesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    late BmiCalculator bmiCalculator;
    return BlocProvider.value(
      value: sl<BmiCalculatorCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Entries History"),
        ),
        body: BlocConsumer<BmiCalculatorCubit, BmiCalculatorState>(
          builder: (context, state) {
            return FirestorePagination(
              isLive: true,
              initialLoader: const Center(
                child: LoadingIndicator(),
              ),
              bottomLoader: const LoadingIndicator(),
              limit: 10,
              query:
                  context.read<BmiCalculatorCubit>().getBmicalculationHistory(),
              itemBuilder: (context, dataSnapshot, index) {
                bmiCalculator = BmiCalculator.fromJson(
                    dataSnapshot.data() as Map<String, dynamic>);
                return BmiEntryCard(bmi: bmiCalculator);
              },
            );
          },
          listener: (BuildContext context, BmiCalculatorState state) {
            if (state is AssignEditValuesSuccessState) {
              showEditBmiEntryBottomSheet(context, bmiCalculator);
            }
            if (state is EditBmiEntrySuccessState) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
