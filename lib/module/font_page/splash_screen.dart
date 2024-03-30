import 'package:VMS/utils/constant/mediaquary_helper.dart';
import 'package:flutter/material.dart';
import 'package:VMS/utils/constant/images_directory.dart';

import '../../config/app_route.dart';
import '../../widget/custom_botton.dart';

class ViewSplashScreen extends StatefulWidget {
  const ViewSplashScreen({Key? key}) : super(key: key);

  @override
  _ViewSplashScreenState createState() => _ViewSplashScreenState();
}

class _ViewSplashScreenState extends State<ViewSplashScreen> {
  @override
  void initState() {
    super.initState();
    // _navigateToLoginPage();
  }

  // Function to navigate to the LoginPage after a delay
  void _navigateToLoginPage() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.login,
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(ImagesDirectory.splashscreen),
          fit: BoxFit.contain,
          height: MediaQueryHelper.screenHeight(context) * 1.2,
          width: MediaQueryHelper.screenWidth(context) * 1.2,
        ),

        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 200,
                    height: 50,
                    radius: 15,
                    title: "Login",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.login,

                      );
                    },
                    // isLoading: authProvider.loadingSignUp == true,
                  ),
                  MediaQueryHelper.defaultHeight10,
                  CustomButton(
                    radius: 15,
                    width: 200,
                    height: 50,
                    title: "Sign Up",
                    onPressed: () {

                      Navigator.pushNamed(
                        context,
                        Routes.signUp,

                      );
                    },
                    // isLoading: authProvider.loadingSignUp == true,
                  ),
                  MediaQueryHelper.defaultHeight30,
                  MediaQueryHelper.defaultHeight30,
                ],
              ),
            ))
      ],
    );
  }
}
