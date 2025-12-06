import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/utilities/my_draw_dialog.dart';
import 'package:tic_tac_toe/utilities/my_win_dialog.dart';

class GameBoard extends StatefulWidget {
  final String username1;
  final String username2;
  const GameBoard({
    super.key,
    required this.username1,
    required this.username2,
  });

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> displayMoves = ['', '', '', '', '', '', '', '', ''];

  bool playerTurn = true;

  int playerExScore = 0;
  int playerOhScore = 0;
  int tieScore = 0;

  int fillBox = 0;

  // display player moves
  void tapMoves(int index) {
    setState(() {
      if (displayMoves[index].isEmpty) {
        if (playerTurn) {
          displayMoves[index] = 'O';
          fillBox += 1;
        } else {
          displayMoves[index] = 'X';
          fillBox += 1;
        }
        playerTurn = !playerTurn;
        checkWin(index);
      }
    });
  }

  // clear board
  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayMoves[i] = '';
      }
    });
  }

  // reset game
  void resetGame() {
    clearBoard();
    fillBox = 0;
    playerOhScore = 0;
    playerExScore = 0;
    tieScore = 0;
  }

  // continue button
  void nextRound() {
    clearBoard();
    fillBox = 0;
    Navigator.of(context).pop();
  }

  // check win
  void checkWin(int index) {
    if (
    // check 1st row
    displayMoves[0] == displayMoves[1] &&
            displayMoves[0] == displayMoves[2] &&
            displayMoves[0] != '' ||
        // check 2nd row
        displayMoves[3] == displayMoves[4] &&
            displayMoves[3] == displayMoves[5] &&
            displayMoves[3] != '' ||
        // check 3rd row
        displayMoves[6] == displayMoves[7] &&
            displayMoves[6] == displayMoves[8] &&
            displayMoves[6] != '' ||
        // check 1st column
        displayMoves[0] == displayMoves[3] &&
            displayMoves[0] == displayMoves[6] &&
            displayMoves[0] != '' ||
        // check 2nd column
        displayMoves[1] == displayMoves[4] &&
            displayMoves[1] == displayMoves[7] &&
            displayMoves[1] != '' ||
        // check 3rd column
        displayMoves[2] == displayMoves[5] &&
            displayMoves[2] == displayMoves[8] &&
            displayMoves[2] != '' ||
        // check 1st diagonal
        displayMoves[0] == displayMoves[4] &&
            displayMoves[0] == displayMoves[8] &&
            displayMoves[0] != '' ||
        // check 2nd diagonal
        displayMoves[6] == displayMoves[4] &&
            displayMoves[6] == displayMoves[2] &&
            displayMoves[6] != '') {
      dialogWin(displayMoves[index]);
    } else if (fillBox == 9) {
      tieScore += 1;
      dialogDraw();
    }
  }

  // show player winner
  void dialogWin(String winner) {
    setState(() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return MyWinDialog(onNextRound: nextRound, winner: winner);
        },
      );
    });
    if (winner == 'O') {
      playerOhScore += 1;
    } else if (winner == 'X') {
      playerExScore += 1;
    }
  }

  // show draw dialog
  void dialogDraw() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return MyDrawDialog(onNextRound: nextRound);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192a33),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(15, 20, 15, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // sort of appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "XO",
                    style: GoogleFonts.poppins(
                      color: Color(0xffaac1cb),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff1f3640),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(200),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(40, 15, 40, 15),
                      child: Row(
                        children: [
                          Text(
                            playerTurn ? "O" : "X",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Color(0xffaac1cb),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Turn",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Color(0xffaac1cb),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffa8bfc9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(200),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: IconButton(
                      onPressed: resetGame,
                      icon: Icon(Icons.restore, size: 30),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: displayMoves.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => tapMoves(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff1f3640),
                            borderRadius: BorderRadiusDirectional.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(200),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              displayMoves[index],
                              style: GoogleFonts.mochiyPopPOne(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                color: displayMoves[index] == 'O'
                                    ? Color(0xff30c4be)
                                    : Color(0xfff2b137),
                              ),
                              //  fontSize: 50,
                              //  fontWeight: FontWeight.w800,
                              //),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 0.6,
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: Color(0xff30c4be),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(200),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.username1.isEmpty
                                  ? "O"
                                  : "O (${widget.username1})",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "$playerOhScore",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: Color(0xffa8bfc9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(200),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TIES",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$tieScore",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: Color(0xfff2b137),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(200),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.username2.isEmpty
                                  ? "X"
                                  : "X (${widget.username2})",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "$playerExScore",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
