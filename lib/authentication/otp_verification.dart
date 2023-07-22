import 'package:flutter/material.dart';
import 'package:nike/authentication/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  final String email;
  final bool isResetPassword; // Flag to indicate if it's for password reset

  const OtpVerificationPage({
    Key? key,
    required this.email,
    required this.isResetPassword,
    required String phoneNumber,
  }) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the OTP sent to ${widget.email}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: _otpController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                // Handle OTP input changes
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Always navigate to the ResetPasswordPage when the Verify OTP button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      title: '',
                    ),
                  ),
                );
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
