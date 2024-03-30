import 'package:VMS/utils/constant/text_directory.dart';
import 'package:VMS/widget/custom_botton.dart';
import 'package:VMS/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  bool isVerificationMode = false;
  bool _verificationSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${UIStrings.forgetPassword}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isVerificationMode)
              _buildEmailField()
            else
              _buildVerificationCodeField(),
            SizedBox(height: 16.0),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: emailController,
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildVerificationCodeField() {
    return TextField(
      controller: verificationCodeController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Verification Code',
      ),
    );
  }

  Widget _buildActionButton() {
    return CustomButton(
        title: (isVerificationMode ? 'Verify Code' : 'Send Verification Code'),
        onPressed: () {
          setState(() {
            if (!isVerificationMode) {
              // Perform email verification and transition to verification code entry
              // For simplicity, let's assume the email is valid and move to the verification mode
              isVerificationMode = true;
            } else {
              // Perform verification code validation and further actions
              // For simplicity, let's assume the verification code is valid
              if (!_verificationSuccessful) {
                _showSnackBar('Verification Successful');
                _verificationSuccessful = true;
              }
            }
          });
        });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }
}
