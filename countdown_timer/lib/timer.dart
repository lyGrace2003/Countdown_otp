import 'dart:async';

import 'package:flutter/material.dart';

class CountodownTimerDemo extends StatefulWidget {
  const CountodownTimerDemo({super.key});

  @override
  State<CountodownTimerDemo> createState() => __CountodownTimerDemoState();
}

class __CountodownTimerDemoState extends State<CountodownTimerDemo> {
 Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 1);
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  /// Timer related methods ///
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 1));
  }
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        stopTimer();
        showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  const Text('OTP'),
        content: const Text('Verification invalid'),
         actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
      );
    },
        );
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countodown Timer'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
            '$seconds',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
            const SizedBox(height: 20),
           
            ElevatedButton(
              onPressed: (){resetTimer();startTimer();},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Resend OTP',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}