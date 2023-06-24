import 'package:benaiah_okwukwe_anukem/app/app.dart';
import 'package:benaiah_okwukwe_anukem/bootstrap.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() {
  bootstrap(
    () => DevicePreview(
      enabled: defaultTargetPlatform != TargetPlatform.android &&
          defaultTargetPlatform != TargetPlatform.iOS,
      builder: (_) => const App(),
    ),
  );
}
