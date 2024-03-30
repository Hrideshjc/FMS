import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onPressed;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? radius;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.title,
    this.height,
    this.radius,
    this.borderRadius,
    this.textColor,
    this.width,
    this.backgroundColor,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 55,
      width: width ?? double.infinity,
      child: ElevatedButton(

        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ?const Text("...")
            : Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
      ),
    );
  }
}
