import 'package:VMS/language/language_selector.dart';
import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:VMS/utils/constant/mediaquary_helper.dart';
import 'package:VMS/utils/constant/text_directory.dart';
import 'package:VMS/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/app_route.dart';
import '../../../language/language_state.dart';
import '../../../theme/theme.dart';
import '../../../utils/constant/validation.dart';
import '../../../widget/custom_botton.dart';
import '../auth_state/auth_state.dart';
import 'card_shape.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authProvider, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: Container(
            child: Form(
              key: authProvider.loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildUpperBody(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  _buildUpperBody() {
    return Consumer<LanguageState>(builder: (context, langProvider, _) {
      return Consumer<AuthState>(builder: (context, authProvider, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImagesDirectory.appLogo,
                fit: BoxFit.contain,
                height: MediaQueryHelper.screenHeight(context) * 0.4,
                width: MediaQueryHelper.screenWidth(context) * 0.6,
              ),

              MediaQueryHelper.defaultHeight20,

              const Text(
                "Futsal Management System ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              MediaQueryHelper.defaultHeight30,
              MediaQueryHelper.defaultHeight30,
              CustomTextField(
                controller: authProvider.emailLoginController,
                labelText: '${UIStrings.emailEnter}',
              ),
              CustomTextField(
                controller: authProvider.passwordLoginController,
                labelText: '${UIStrings.passwordEnter}',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        authProvider.viewLoginPassword =
                            !authProvider.viewLoginPassword;
                      });
                    },
                    icon: Icon(
                      authProvider.viewLoginPassword
                          ? Icons.remove_red_eye
                          : Icons.password,
                    )),
                obscureText: authProvider.viewLoginPassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgetPassword);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${UIStrings.forgetPassword}"),
                    ),
                  ),
                ],
              ),
              MediaQueryHelper.defaultHeight10,
              CustomButton(
                radius: 5,
                title: "${UIStrings.login}",
                onPressed: () {
                  print("heoolo mg");
                  authProvider.sendLoginData(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const DashboardView()));
                },
                // isLoading: authProvider.loadingAuth == true,
              ),
              MediaQueryHelper.defaultHeight20,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.signUp);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${UIStrings.signUp}"),
                ),
              ),
              // ListTile(
              //   title: Text('Current Theme Mode:'),
              //   subtitle: Text(
              //       context.watch<ThemeModel>().currentThemeMode.toString()),
              //   onTap: () {
              //     context.read<ThemeModel>().toggleTheme();
              //   },
              //   trailing: Icon(Icons.color_lens),
              // )
            ],
          ),
        );
      });
    });
  }
}
