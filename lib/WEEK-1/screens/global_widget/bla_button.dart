import 'package:flutter/material.dart';
import 'package:new_flutter/model/ride/locations.dart';
import 'package:new_flutter/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;
  final IconData? trailingIcon;
  final Location? location;
  final VoidCallback? onTrailingIconTap;

  const BlaButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
    this.isPrimary = false,
    this.trailingIcon,
    this.location, this.onTrailingIconTap,
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
                Icon(icon, color: isPrimary ? BlaColors.white : Colors.black54),
                SizedBox(width: BlaSpacings.s),
                Text(
                  text,
                  style: BlaTextStyles.body.copyWith(
                    color: isPrimary ? BlaColors.white : Colors.black,
                  ),
                ),
              ],
            ),
            if (location != null) IconButton(onPressed: onTrailingIconTap, icon: Icon(Icons.swap_vert, color: BlaColors.primary),),
              if (trailingIcon != null)
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
