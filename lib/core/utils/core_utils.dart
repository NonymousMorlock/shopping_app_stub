import 'package:benaiah_okwukwe_anukem/core/common/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CoreUtils {
  static void showToast(
    BuildContext context, {
    String? message,
    IToast? toast,
    Widget? icon,
    Color? colour,
    Color? textColour,
    double? borderRadius,
    ToastGravity? gravity,
  }) {
    assert(
      message != null || toast != null,
      'You must provide a message or a custom toast widget',
    );
    final fToast = FToast()..init(context);
    final customToast = toast ??
        IToast(
          message: message!,
          borderRadius: borderRadius,
          colour: colour,
          textColour: textColour,
          icon: icon,
        );

    fToast.showToast(
      child: customToast,
      gravity: gravity ?? ToastGravity.TOP,
    );

    // Custom Toast Position
    // ..showToast(
    //   child: toast,
    //   positionedToastBuilder: (context, child) {
    //     return Positioned(
    //       top: 16,
    //       left: 16,
    //       child: child,
    //     );
    //   },
    // );
  }
}
