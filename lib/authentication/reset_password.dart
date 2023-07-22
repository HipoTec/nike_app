import 'package:flutter/material.dart';
import 'package:nike/authentication/otp_verification.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({required this.title}) : super();
  final String title;
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          color: const Color.fromRGBO(0, 0, 0, 1),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // Center the content vertically
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40), // Add some spacing
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Enter the email account to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '**********',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: _buildResetButton()),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return Container(
      height: 60.0,
      width: 400.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpVerificationPage(
                      email: "", isResetPassword: true, phoneNumber: "")));
        },
        child: Text(
          'Reset Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }
}
