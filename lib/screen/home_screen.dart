import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screen/help_screen.dart';
import 'package:weather_app/services/weather_api.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  List<Weather> weather=[];
  
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.purple,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Weather APP',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xfff7e5b7),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpScreen()));
                        },
                        child: Text('Help'),
                      ),
                    ),
                  ],
                ),
                
                Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                            controller: searchController,
                            
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search any City Name...'),
                      ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(20),
                  height: 80,
                ),
                SizedBox(height: 15,),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(26),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(30),
                    ),
                    Container(
                      height: 200,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(30),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
