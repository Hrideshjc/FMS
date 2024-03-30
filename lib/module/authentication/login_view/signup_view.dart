import 'package:VMS/utils/constant/text_directory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constant/images_directory.dart';
import '../../../utils/constant/mediaquary_helper.dart';
import '../../../utils/constant/validation.dart';
import '../../../widget/custom_botton.dart';
import '../../../widget/custom_text_field.dart';
import '../auth_state/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Consumer<AuthState>(builder: (context, authProvider, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: authProvider.registerFormKey,
              child: Column(
                children: [
                  MediaQueryHelper.defaultHeight30,
                  Image.asset(
                    ImagesDirectory.appLogo,
                    fit: BoxFit.contain,
                    height: MediaQueryHelper.screenHeight(context) * 0.2,
                    width: MediaQueryHelper.screenWidth(context) * 0.5,
                  ),
                  MediaQueryHelper.defaultHeight30,
                  Text(
                    "${UIStrings.appName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  MediaQueryHelper.defaultHeight30,
                  CustomTextField(
                    controller: authProvider.nameRegisterController,
                    labelText: '${UIStrings.nameEnter}',
                    validator: (value) => validateIsEmpty(string: value!),
                  ),
                  CustomTextField(
                    controller: authProvider.emailRegisterController,
                    labelText: '${UIStrings.emailEnter}',
                    // validator: (value) => validateEmail(string: value!),
                  ),
                  CustomTextField(
                    controller: authProvider.passwordRegisterController,
                    labelText: '${UIStrings.passwordEnter}',
                    // validator: (value) => validatePassword(string: value!),
                    suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            authProvider.viewRegisterPassword =
                                !authProvider.viewRegisterPassword;
                          });
                        },
                        icon: Icon(
                          authProvider.viewRegisterPassword
                              ? Icons.remove_red_eye
                              : Icons.password,
                        )),
                    obscureText: authProvider.viewRegisterPassword,
                  ),
                  CustomTextField(
                    controller: authProvider.conformPasswordRegisterController,
                    labelText: '${UIStrings.conformPasswordEnter}',
                    // validator: (value) => confirmPassword(
                    //     password: authProvider.passwordRegisterController.text,
                    //     cPassword: authProvider
                    //         .conformPasswordRegisterController.text),
                    suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            authProvider.viewRegisterConformPassword =
                                !authProvider.viewRegisterConformPassword;
                          });
                        },
                        icon: Icon(
                          authProvider.viewRegisterConformPassword
                              ? Icons.remove_red_eye
                              : Icons.password,
                        )),
                    obscureText: authProvider.viewRegisterConformPassword,
                  ),
                  MediaQueryHelper.defaultHeight10,
                  CustomButton(
                    radius: 5,
                    title: "${UIStrings.signUp}",
                    onPressed: () {
                      authProvider.registerCostumerController(context);

                    },
                    // isLoading: authProvider.loadingSignUp == true,
                  ),
                  MediaQueryHelper.defaultHeight20,
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
