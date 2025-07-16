import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color? color;
  final Color? textColor;
  final VoidCallback voidCallback;
  final String? imagePath;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.name,
    this.color,
    this.textColor,
    required this.voidCallback,
    this.imagePath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        height: 56,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color:
              color ??
              (imagePath != null
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(AppDimensions.paddingSm),
          border:
              imagePath == null
                  ? null
                  : Border.all(
                    color: Theme.of(
                      context,
                    ).disabledColor.withValues(alpha: 0.4),
                  ),
        ),
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (imagePath != null)
                      Padding(
                        padding: const EdgeInsets.all(AppDimensions.paddingXSm),
                        child: Image.asset(imagePath!),
                      ),
                    Text(
                      name,
                      style:
                          imagePath == null
                              ? Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(color: textColor)
                              : Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
      ),
    );
  }
}
