import 'package:flutter/material.dart';
import 'app_colors.dart';
import '/service/calculateExport.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  FocusNode displayFocus = FocusNode();

  ScrollController _scrollController = ScrollController();

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

  void addText(String value) {
    if (value == "+" ||
        value == "-" ||
        value == "×" ||
        value == "/" ||
        value == "%") {
      controller.text = controller.text + controller2.text + value;
      controller2.text = '';
    } else {
      controller2.text = controller2.text + value;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
    }
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
              //textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
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
                //textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.none,
                focusNode: displayFocus,
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
                  final text = controller2.text;
                  if (text.isEmpty) return;
                  final newText = text.substring(0, text.length - 1);
                  controller2.value = TextEditingValue(
                    text: newText,
                    selection: TextSelection.collapsed(offset: newText.length),
                  );
                }, background: AppColors.gray),
                calcButton("CE", () {
                  controller.text = "";
                  controller2.text = "";
                }, background: AppColors.gray),
                calcButton("%", () {
                  controller.text += ((double.parse(controller2.text)) / 100)
                      .toString();
                  controller2.text = "";
                }, background: AppColors.gray),
                calcButton("+", () => addText("+")),
              ],
            ),
            Row(
              children: [
                calcButton(
                  "1",
                  () => addText("1"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "2",
                  () => addText("2"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "3",
                  () => addText("3"),
                  background: AppColors.lightGray,
                ),
                calcButton("-", () => addText("-")),
              ],
            ),
            Row(
              children: [
                calcButton(
                  "4",
                  () => addText("4"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "5",
                  () => addText("5"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "6",
                  () => addText("6"),
                  background: AppColors.lightGray,
                ),
                calcButton("×", () => addText("×")),
              ],
            ),
            Row(
              children: [
                calcButton(
                  "7",
                  () => addText("7"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "8",
                  () => addText("8"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "9",
                  () => addText("9"),
                  background: AppColors.lightGray,
                ),
                calcButton("/", () => addText("/")),
              ],
            ),
            Row(
              children: [
                calcButton(
                  ".",
                  () => addText("."),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  "0",
                  () => addText("0"),
                  background: AppColors.lightGray,
                ),
                calcButton(
                  ",",
                  () => addText(","),
                  background: AppColors.lightGray,
                ),
                calcButton("=", () {
                  controller.text = controller.text + controller2.text;
                  String mathtext = controller.text.replaceAll('×', '*');
                  math = mathtext + ';';
                  String result = parser(math).toString();
                  print(result);
                  controller2.text = result;
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
