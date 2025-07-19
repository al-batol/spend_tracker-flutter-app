import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';

class CodeCellsWidget extends StatefulWidget {
  final List<TextEditingController> _controllers;
  final List<FocusNode> _focusNodes;
  final int _fieldsCount;

  const CodeCellsWidget({
    super.key,
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
    required int fieldsCount,
  }) : _controllers = controllers,
       _focusNodes = focusNodes,
       _fieldsCount = fieldsCount;

  @override
  State<CodeCellsWidget> createState() => _CodeCellsWidgetState();
}

class _CodeCellsWidgetState extends State<CodeCellsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget._fieldsCount,
        (index) => SizedBox(
          width: 48,
          height: 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (widget._controllers[index].text.trim().isEmpty)
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: AppColors.inputBg,
                    shape: BoxShape.circle,
                  ),
                ),
              TextFormField(
                controller: widget._controllers[index],
                textAlign: TextAlign.center,
                focusNode: widget._focusNodes[index],
                cursorColor: Colors.transparent,
                maxLength: 1,
                style: Theme.of(context).textTheme.headlineMedium,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  counterText: '',
                ),
                onChanged: (value) {
                  if (value.isNotEmpty && index < widget._fieldsCount - 1) {
                    widget._focusNodes[index + 1].requestFocus();
                  }
                  if (value.isEmpty && index > 0) {
                    widget._focusNodes[index - 1].requestFocus();
                  }
                  if (value.isNotEmpty && index == widget._fieldsCount - 1) {
                    widget._focusNodes[index].unfocus();
                  }
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
