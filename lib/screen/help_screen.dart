// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screen/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,//to avoid screen overflow incase of keyboard open
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/help.png'),
              ),
            ),
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 90, bottom: 50, left: 60, right: 60),
                  child: Text('“We show weather for you”',
                      style: GoogleFonts.capriola(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xfff7e5b7),
                      )),
                ),
              ),
              SizedBox(
                width: 88,
                height: 110,
                child: Image.asset(
                  'assets/R.png',
                  width: 88,
                  height: 110,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Weather APP',
                style: GoogleFonts.lato(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xfff7e5b7),
                ),
              ),
              const SizedBox(
                height: 180,
                child: SpinKitCircle(
                  color: Colors.lightBlueAccent,
                  size: 50.0,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Homepage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: const Color.fromARGB(255, 241, 205, 114),
                splashColor: Colors.blueAccent,
                foregroundColor: Colors.black45,
                autofocus: true,
                child: const Icon(Icons.navigate_next_rounded),
              ),
            ])));
  }
}