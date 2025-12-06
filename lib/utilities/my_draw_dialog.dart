import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/utilities/my_button.dart';

class MyDrawDialog extends StatelessWidget {
  final VoidCallback onNextRound;
  const MyDrawDialog({super.key, required this.onNextRound});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Color(0xff1f3640),
          child: AlertDialog(
            backgroundColor: Color(0xff1f3640),
            content: Column(
              children: [
                Text(
                  "Draw!",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color(0xffa8bfc9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.handshake, size: 50, color: Color(0xffa8bfc9)),
                      const SizedBox(width: 10),
                      Text(
                        "You're both good",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xffa8bfc9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  backgroundColor: Color(0xffa8bfc9),
                  btnName: "Continue",
                  onPressed: onNextRound,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
