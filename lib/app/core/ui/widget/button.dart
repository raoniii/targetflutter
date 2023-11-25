import 'package:flutter/material.dart';

class TargetButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor; // Adicione essa linha

  const TargetButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.width,
    this.height = 50,
    this.backgroundColor,
    this.textColor, // Adicione essa linha
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor ?? Color(0xFF43bd6e),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}
