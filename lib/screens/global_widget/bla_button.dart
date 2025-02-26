import 'package:flutter/material.dart';
import 'package:new_flutter/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;
  final IconData? trailingIcon;

  const BlaButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
    this.isPrimary = false,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? BlaColors.primary : Colors.white,
          foregroundColor: isPrimary ? BlaColors.white : Colors.black,
          padding: EdgeInsets.all(BlaSpacings.m),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            side: isPrimary ? BorderSide.none : BorderSide(color: Colors.grey),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) Icon(icon, color: isPrimary ? BlaColors.white : Colors.black54),
                SizedBox(width: BlaSpacings.s),
                Text(
                  text,
                  style: BlaTextStyles.body.copyWith(
                    color: isPrimary ? BlaColors.white : Colors.black,
                  ),
                ),
              ],
            ),
            if (trailingIcon != null) Icon(trailingIcon),
          ],
        ),
      ),
    );
  }
}
