import 'package:flutter/material.dart';
import 'app_colors.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  double buttonSize = 45;
  String math = '';

  Widget calcButton(
    String text,
    VoidCallback onPressed, {
    double top = 6,
    double bottom = 0,
    double left = 5,
    double right = 0,
    Color background = AppColors.accent,
    Color foreground = AppColors.secondary,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          minimumSize: Size(50, 50),
          fixedSize: Size(93, 93),
          padding: EdgeInsets.zero,

          backgroundColor: background,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: buttonSize,
            fontWeight: FontWeight.bold,

            color: foreground,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: InputBorder.none,
              ),
              controller: controller,
              textDirection: TextDirection.rtl,
              readOnly: true,
              showCursor: true,
              cursorColor: AppColors.secondary,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: AppColors.gray,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  border: InputBorder.none,
                ),
                controller: controller2,
                textDirection: TextDirection.rtl,
                readOnly: true,
                showCursor: true,
                cursorColor: AppColors.secondary,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: AppColors.secondary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Row(
              children: [
                calcButton("C", () {
                  String str = controller2.text;
                  str = str.replaceFirst(RegExp(r'.$'), '');
                  controller2.text = str;
                }, background: AppColors.gray),
                calcButton("CE", () {
                  controller.text = "";
                  controller2.text = "";
                }, background: AppColors.gray),
                calcButton(
                  "%",
                  () => controller2.text += "%",
                  background: AppColors.gray,
                ),
                calcButton("+", () => controller2.text += "+"),
              ],
            ),
            Row(
              children: [
                calcButton(
                  "1",
                  () => controller2.text += "1",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "2",
                  () => controller2.text += "2",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "3",
                  () => controller2.text += "3",
                  background: AppColors.lightGray,
                ),
                calcButton("-", () => controller2.text += "-"),
              ],
            ),
            Row(
              children: [
                calcButton(
                  "4",
                  () => controller2.text += "4",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "5",
                  () => controller2.text += "5",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "6",
                  () => controller2.text += "6",
                  background: AppColors.lightGray,
                ),
                calcButton("*", () => controller2.text += "*"),
              ],
            ),
            Row(
              children: [
                calcButton(
                  "7",
                  () => controller2.text += "7",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "8",
                  () => controller2.text += "8",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "9",
                  () => controller2.text += "9",
                  background: AppColors.lightGray,
                ),
                calcButton("/", () => controller2.text += "/"),
              ],
            ),
            Row(
              children: [
                calcButton(
                  ".",
                  () => controller2.text += ".",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "0",
                  () => controller2.text += "0",
                  background: AppColors.lightGray,
                ),
                calcButton(
                  ",",
                  () => controller2.text += ",",
                  background: AppColors.lightGray,
                ),
                calcButton("=", () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
