import 'package:flutter/material.dart';
import 'package:nike/authentication/register.dart';
import 'package:nike/authentication/reset_password.dart';
import 'package:nike/homeAndDrawer/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.title}) : super();
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                child: Text('Hello Again!',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20), // Add some spacing
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
                    _buildUserNameField(),
                    SizedBox(height: 20.0),
                    _buildPasswordField(),
                    SizedBox(height: 20.0),
                    _buildForgotPassword(),
                    SizedBox(height: 40.0),
                    _isLoading
                        ? CircularProgressIndicator()
                        : _buildLoginButton(),
                    SizedBox(height: 20.0),
                    _buildSignInWithGoogleButton(),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              _buildRegisterText(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTitle() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     // crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Text(
  //         'Hello Again!',
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 10.0),
  //       Text(
  //         'Fill your details or continue with social media',
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 16.0, color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildUserNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email"), // Add the "Email" text
        SizedBox(height: 8), // Add some spacing
        TextFormField(
          decoration: InputDecoration(
            hintText: 'loremipsum@gmail.com',
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
        Text("Password"), // Add the "Password" text
        SizedBox(height: 8), // Add some spacing
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter your password',
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
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment(1.0, 0.0),
      padding: EdgeInsets.only(top: 15.0, left: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  ResetPasswordPage(title: 'Reset Password'),
            ),
          );
        },
        child: Text(
          'Recovery Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 60.0,
      width: 400.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        child: Text(
          'LOGIN',
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
          'Sign In with Google',
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
}
