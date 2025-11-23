import 'dart:async';
import 'package:flutter/material.dart';

class LoginCooldownController {
  int seconds = 0;
  bool isCooldown = false;
  Timer? _timer;

  /// يبدأ العد التنازلي
  void startCooldown({
    required int duration,
    required VoidCallback onTick,   // نوعها: void Function()
    required VoidCallback onFinish, // نوعها: void Function()
  }) {
    // لو فيه مؤقت سابق، نلغيه
    _timer?.cancel();

    seconds = duration;
    isCooldown = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        onTick();        // نستدعي setState()
      } else {
        isCooldown = false;
        timer.cancel();
        onFinish();      // نستدعي setState() في النهاية
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
