
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  double min(double a,double b){
    if(a<b){
      return a;
    }
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.80,
          child: Card(
            elevation: 5,
            color: Colors.blue.withOpacity(0.35),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              child: SizedBox(
                width: min(MediaQuery.of(context).size.width, 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App title
                    const Text(
                      'Vactrack',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Managing Vaccine Records Simplified',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[100],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Register button
                    ActionButton(
                      text: 'Register as Hospital',
                      onPressed: () {
                        // Navigate to hospital registration screen
                      },
                    ),
                    const SizedBox(height: 20),

                    // Login as Hospital button
                    ActionButton(
                      text: 'Login as Hospital',
                      onPressed: () {
                        // Navigate to hospital login screen
                      },
                    ),
                    const SizedBox(height: 20),

                    // Login as Doctor button
                    ActionButton(
                      text: 'Login as Doctor',
                      onPressed: () {
                        // Navigate to doctor login screen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ActionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}