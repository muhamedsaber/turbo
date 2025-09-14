import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    this.isLoading,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading == true,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading == true
              ? SizedBox(
                height:20,
                width: 20,
                child: CircularProgressIndicator(
                color: Colors.white,
                ),
              )
              : Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
        ),
      ),
    );
  }
}

