import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String playerExOh;
  final Color backgroundColor;
  final Color borderColor;
  const MyTextField({
    super.key,
    required this.controller,
    required this.playerExOh,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.grey[500],
              style: TextStyle(color: Colors.grey[300]),
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Enter username",
              ),
            ),
          ),
          SizedBox(
            width: 60,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  playerExOh,
                  style: GoogleFonts.poppins(
                    fontSize: 39,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff192a33),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
