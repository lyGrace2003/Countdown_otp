import 'package:countdown_timer/timer.dart';
import 'package:flutter/material.dart';

class SendOTP extends StatelessWidget {
  const SendOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Countdown Timer"),
      ),
      body: Center(
        child: ElevatedButton(
        onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                const CountodownTimerDemo()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
        child: const Text(
                'Send OTP',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
      )
    );
  }
}