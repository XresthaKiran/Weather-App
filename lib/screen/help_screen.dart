import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screen/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  HelpScreenState createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/help.png'),
          ),
            gradient: LinearGradient(begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color.fromARGB(255, 21, 101, 192), Color.fromARGB(255, 100, 181, 246)]),
          

        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top:120,
                    bottom: 50,
                    left: 60,
                    right: 60,
                  ),
                  child: Text(
                    '“We show weather for you”',
                    style: GoogleFonts.capriola(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xfff7e5b7),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.width/4,
                child: Image.asset(
                  'assets/R.png',
                  width: MediaQuery.of(context).size.width/4,
                  height: MediaQuery.of(context).size.width/4,
                ),
              ),
               SizedBox(height:20),
              Text(
                'Weather APP',
                style: GoogleFonts.lato(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xfff7e5b7),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width/2,
                child: SpinKitCircle(
                  color: Colors.lightBlueAccent,
                  size: 50.0,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromARGB(255, 99, 156, 253),
                splashColor: Colors.blueAccent,
                foregroundColor: Colors.black45,
                child:Text('Skip',style: GoogleFonts.capriola(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 249, 233)),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
