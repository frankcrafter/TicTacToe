import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RouteButton extends StatelessWidget {
  final VoidCallback changePage;
  const RouteButton({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
        ),
        onPressed: changePage,
        child: Text(
          "Let's Play!",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
