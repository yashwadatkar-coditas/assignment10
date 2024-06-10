import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const CustomButton({super.key, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xff4152b4)),
        foregroundColor: MaterialStatePropertyAll(Color(0XFFFFFFFF)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
      onPressed: (){
        onpress();
      },child: Center(child: Text(text,style: GoogleFonts.heebo(
        fontSize:14, 
        fontWeight:FontWeight.w500,
      ),)),);
  }
}