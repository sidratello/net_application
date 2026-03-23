import 'dart:async';
import 'package:flutter/material.dart';

class LoginCooldownController {
  int seconds = 0;
  bool isCooldown = false;
  Timer? _timer;

 
  void startCooldown({
    required int duration,
    required VoidCallback onTick,  // نوعها: void Function()
    required VoidCallback onFinish, // نوعها: void Function()
  }) {
    
    _timer?.cancel();

    seconds = duration;
    isCooldown = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        onTick();        
      } else {
        isCooldown = false;
        timer.cancel();
        onFinish();      
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
