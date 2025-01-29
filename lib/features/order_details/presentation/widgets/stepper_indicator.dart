import 'package:flutter/material.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep; // Current active step
  final int totalSteps; // Total number of steps

  const StepperIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(totalSteps   , (index) {
        // if (index % 2 == 0) {
          // Step circle
          int stepIndex = (index ~/ 1)+1;
          return Container(
            width: 55,
            height: 6,
            decoration: BoxDecoration(
              color: stepIndex <= currentStep ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        // } else {
        //   // Dashed line between circles
        //   return Container(
        //     width: 55,
        //     height: 6,
        //     color: Colors.grey,
        //
        //   );
        // }
      }),
    );
  }
}

