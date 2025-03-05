import 'package:flutter/material.dart';
import 'package:new_flutter/screens/global_widget/bla_button.dart';
import 'package:new_flutter/theme/theme.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Variations Test")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Primary Button:", style: BlaTextStyles.heading),
            SizedBox(height: 8),
            BlaButton(icon: Icons.star, text: "With Icon", onTap: () {}, isPrimary: true,),
            SizedBox(height: 8),
            BlaButton(text: "No Icon", onTap: () {}, isPrimary: true),

            SizedBox(height: 16),
            Text("Secondary Button:", style: BlaTextStyles.heading),
            SizedBox(height: 8),
            BlaButton(icon: Icons.settings, text: "With Icon", onTap: () {}),
            SizedBox(height: 8),
            BlaButton(text: "No Icon", onTap: () {}),
            SizedBox(height: 8),
            BlaButton(text: "With Checkbox", onTap: () {}),
          ],
        ),
      ),
    );
  }
}