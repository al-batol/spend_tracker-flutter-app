import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color? color;
  final Color? textColor;
  final VoidCallback voidCallback;
  const CustomButton({
    super.key,
    required this.name,
    this.color,
    this.textColor,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(AppDimensions.paddingSm),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(AppDimensions.paddingSm),
        ),
        child: Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
