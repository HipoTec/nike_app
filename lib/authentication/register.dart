import 'package:flutter/material.dart';
import 'package:nike/authentication/login.dart';
import 'package:nike/authentication/otp_verification.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({required this.title}) : super();
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
          title: Text(widget.title),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Register Account',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10), // Add some spacing
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Fill your details or continue with social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    _buildNameField(), // Add the Your Name text field
                    SizedBox(height: 15.0),
                    _buildUserNameField(),
                    SizedBox(height: 15.0),
                    _buildPasswordField(),

                    SizedBox(height: 40.0),
                    _isLoading
                        ? CircularProgressIndicator()
                        : _buildRegisterButton(), // Change this to the Register button
                    SizedBox(height: 20.0),
                    _buildSignInWithGoogleButton(),
                  ],
                ),
              ),
              _buildSignInText()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Name"), // Add the "Email" text
        SizedBox(height: 8), // Add some spacing
        TextFormField(
          decoration: InputDecoration(
            hintText: 'xxxxxxx',
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email"), // Add the "Email" text
        SizedBox(height: 8), // Add some spacing
        TextFormField(
          decoration: InputDecoration(
            hintText: 'loremIpsum@gmail.com',
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password"), // Add the "Email" text
        SizedBox(height: 8), // Add some spacing
        TextFormField(
          decoration: InputDecoration(
            hintText: '********',
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      height: 60.0,
      width: 400.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => OtpVerificationPage(
                    email: "", isResetPassword: false, phoneNumber: ""),
              ));
        },
        child: Text(
          'REGISTER',
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

  Widget _buildSignInWithGoogleButton() {
    return Container(
      height: 50.0,
      width: 600,
      child: ElevatedButton.icon(
        onPressed: () {
          // Implement your Sign In with Google logic here
        },
        icon: Image.asset(
          'assets/google_icon.png',
          height: 24.0,
          width: 24.0,
        ), // Replace 'assets/google_icon.png' with the path to your Google icon image
        label: Text(
          'Sign Up with Google',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Text(
          'Already Have Account?',
          style: TextStyle(),
        ),
        SizedBox(width: 5.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(title: 'Login'),
              ),
            );
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Text(
          'New User?',
          style: TextStyle(),
        ),
        SizedBox(width: 5.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    RegisterPage(title: 'Register'),
              ),
            );
          },
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
