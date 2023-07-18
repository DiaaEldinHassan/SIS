import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kDarkGreenColor = const Color(0xFF184A2C);
Color gColor = Color.fromARGB(255, 53, 137, 87);
Color kGinColor = const Color(0xFFE5F0EA);
Color kSpiritedGreen = const Color(0xFFC1DFCB);
Color kFoamColor = const Color(0xFFEBFDF2);
Color kGreyColor = Colors.grey.shade600;
final db = FirebaseAuth.instance;

TextStyle kBillTextStyle = GoogleFonts.poppins(
  color: kDarkGreenColor,
  fontSize: 15.0,
);
