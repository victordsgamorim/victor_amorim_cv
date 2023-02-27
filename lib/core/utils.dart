import 'package:flutter/foundation.dart';

class Utils {
  static T? whenPlatformIs<T>({
    T Function()? macOS,
    T Function()? windows,
  }) {
    if (defaultTargetPlatform == TargetPlatform.windows) {
      return windows != null ? windows() : null;
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      return macOS != null ? macOS() : null;
    }
    return null;
  }
}
