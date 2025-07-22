import 'package:flutter/material.dart';
import 'package:sudocu/presentation/custom_widgets/custom_dialog_msg.dart';

void showCustomDialog({
  required String title,
  required String message,
  required BuildContext context,
  required List<Widget> actions,
}) {
  showDialog(
    context: context,
    builder: (_) => CustomDialogWidget(
      title: title,
      message: message,
      actions: actions
    ),
  );
}
