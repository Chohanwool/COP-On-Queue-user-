import 'package:flutter/material.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';
import 'package:on_queue/screen/login_screen.dart';
import 'package:on_queue/screen/queue_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(230, 23, 129, 213),
        ),
        // Text Theme
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          headlineLarge: GoogleFonts.lato(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey[800],
          ),
          bodyMedium: GoogleFonts.lato(fontSize: 16, color: Colors.black87),
        ),
      ),
      //home: const LoginScreen(),
      home: const QueueDashboardScreen(),
    );
  }
}
