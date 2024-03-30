import 'package:VMS/config/app_route.dart';
import 'package:VMS/module/authentication/auth_state/auth_state.dart';
import 'package:VMS/utils/constant/text_directory.dart';
import 'package:VMS/widget/custom_botton.dart';
import 'package:VMS/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constant/validation.dart';

class SignupVerificationView extends StatefulWidget {
  const SignupVerificationView({super.key});

  @override
  State<SignupVerificationView> createState() => _SignupVerificationViewState();
}

class _SignupVerificationViewState extends State<SignupVerificationView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitConfirmationDialog();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("${UIStrings.forgetPassword}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AuthState>(builder: (context, authProvider, _) {
            return Form(
              key: authProvider.otpVerifyFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildVerificationCodeField(authProvider),
                  SizedBox(height: 16.0),
                  CustomButton(title: 'Verify Code', onPressed: () {
                    authProvider.submitOtpForm(context);
                  })
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildVerificationCodeField(AuthState authProvider) {
    return TextFormField(
      controller: authProvider.otpVerifyController,
      keyboardType: TextInputType.number,
      validator:  (value) => validateIsEmpty(string: value!),
      decoration: InputDecoration(
        labelText: 'Verification Code',
      ),

    );
  }

  // Widget _buildActionButton(AuthState authProvider) {
  //   return CustomButton(title: 'Verify Code', onPressed: () {
  //     authProvider.submitOtpForm(context);
  //   });
  // }

  Future<void> _showExitConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Exit  Confirmation"),
          content: Text(
              "Are you sure you want to exit? Your verification is not complete."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
              child: Text("Exit"),
            ),
          ],
        );
      },
    );
  }
}
