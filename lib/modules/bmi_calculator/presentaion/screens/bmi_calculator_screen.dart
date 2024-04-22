import 'package:bmi_app/core/components/custom_text_field.dart';
import 'package:bmi_app/core/service/service_locator.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/base_bmi_calculator_repository.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/widgtes/bmi_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BmiCalculatorCubit(sl<BaseBmiCalculatorRepository>()),
      child: Scaffold(
        body: BlocConsumer<BmiCalculatorCubit, BmiCalculatorState>(
          listener: (context, state) {
            if (state is CalculateBmiStatusSuccessState) {
              context.read<BmiCalculatorCubit>().saveCalculation();
            }
          },
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal:12.0.w),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BmiPointer(),
                  CustomTextField(
                            controller: context
                                .read<BmiCalculatorCubit>()
                                .ageController,
                            hintText: "age"),
                  SizedBox.square(dimension: 8.h,),          
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
                      SizedBox.square(dimension: 8.w,),
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
                  SizedBox.square(dimension: 8.h,),          
                  ElevatedButton(
                    
                    onPressed: (){
                    context.read<BmiCalculatorCubit>().calculateBmiRate();
                  }, child: const Text("Calculate"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}




