import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/utilities/my_button.dart';

class MyWinDialog extends StatelessWidget {
  final String winner;
  final VoidCallback onNextRound;
  const MyWinDialog({
    super.key,
    required this.winner,
    required this.onNextRound,
  });

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
                  "There's a winner!",
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
                      Text(
                        winner,
                        style: GoogleFonts.poppins(
                          color: winner == 'O'
                              ? Color(0xff30c4be)
                              : Color(0xfff2b137),
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Takes the Round!",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: winner == 'O'
                              ? Color(0xff30c4be)
                              : Color(0xfff2b137),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  backgroundColor: winner == 'O'
                      ? Color(0xff30c4be)
                      : Color(0xfff2b137),
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
