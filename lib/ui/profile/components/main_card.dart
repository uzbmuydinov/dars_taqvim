import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCard extends StatelessWidget {
  final Widget iconWidget;
  final Widget iconWidgetLast;
  final String mainText;
  final VoidCallback onPressed;

  const MainCard({
    Key? key,
    required this.iconWidgetLast,
    required this.mainText,
    required this.onPressed,
    required this.iconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 54,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.grey : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 22.13,
          ),
          iconWidget,
          const SizedBox(
            width: 14.13,
          ),
          Text(
            mainText,
            style: TextStyle(
                color: Get.isDarkMode ? Colors.black : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          IconButton(
            splashRadius: 1,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: iconWidgetLast,
          ),
          const SizedBox(
            width: 21.81,
          ),
        ],
      ),
    );
  }
}
