import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/pages/game_board.dart';
import 'package:tic_tac_toe/utilities/my_textfield.dart';
import 'package:tic_tac_toe/utilities/route_button.dart';

class IntroPage extends StatelessWidget {
  final playerOhController = TextEditingController();
  final playerExController = TextEditingController();

  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192a33),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "XO",
                style: GoogleFonts.mochiyPopPOne(
                  fontSize: 100,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                borderColor: Color(0xff30c4be),
                controller: playerOhController,
                backgroundColor: Color(0xff30c4be),
                playerExOh: "O",
              ),
              const SizedBox(height: 20),
              MyTextField(
                borderColor: Color(0xfff2b137),
                controller: playerExController,
                backgroundColor: Color(0xfff2b137),
                playerExOh: "X",
              ),
              const SizedBox(height: 20),
              RouteButton(
                changePage: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameBoard(
                        username1: playerOhController.text,
                        username2: playerExController.text,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
