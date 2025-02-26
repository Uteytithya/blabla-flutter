import 'package:flutter/material.dart';
import 'package:new_flutter/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: BlaColors.primary,
          foregroundColor: BlaColors.white,
          padding: EdgeInsets.symmetric(vertical: BlaSpacings.m),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
          ),
        ),
        onPressed: () {},
        child: Text("Search", style: BlaTextStyles.button.copyWith(color: BlaColors.white)),
      ),
    );
  }
}