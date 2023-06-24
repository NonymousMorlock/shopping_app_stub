// coverage:ignore-file
import 'dart:async';

import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPTimer extends StatefulWidget {
  const OTPTimer({required this.email, super.key});

  final String email;

  @override
  State<OTPTimer> createState() => _OTPTimerState();
}

class _OTPTimerState extends State<OTPTimer> {
  int _mainDuration = 60;

  // Timer duration in seconds
  int _duration = 60;

  int increment = 10;

  // Timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer
    _startTimer();
  }

  bool canResend = false;

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    // Set the timer to expire after the duration
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration--;
      });
      if (_duration == 0) {
        // Increase the duration by 10 seconds after each request
        if (_mainDuration > 60) {
          increment *= 2;
        }
        _mainDuration += increment;
        _duration = _mainDuration;
        // Cancel the timer
        timer.cancel();

        setState(() {
          canResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    // Calculate the number of minutes and seconds
    final minutes = _duration ~/ 60;
    final seconds = _duration.remainder(60);
    return canResend
        ? TextButton(
      onPressed: () {
        _startTimer();
        setState(() {
          canResend = false;
        });
      },
      child: Text(
        'Resend',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    )
        : RichText(
      text: TextSpan(
        text: 'Resend code in ',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: '$minutes:${seconds.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          const TextSpan(text: ' seconds'),
        ],
      ),
    );
  }
}
