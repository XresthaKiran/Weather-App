import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/city.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  CitySelectionScreenState createState() => CitySelectionScreenState();
}

class CitySelectionScreenState extends State<CitySelectionScreen> {
  TextEditingController searchController = TextEditingController();
  List<City> filteredCities = City.citiesList;
  City selectedCity = City(isSelected: false, city: 'Kathmandu', country: 'Nepal');
  bool isSaved=false;

  @override
  void initState() {
    super.initState();
    filteredCities.sort((a, b) => a.city.compareTo(b.city));
  }

  void filterCities(String cityName) {
    setState(() {
      filteredCities = City.citiesList
          .where((city) =>
              city.city.toLowerCase().startsWith(cityName.toLowerCase()))
          .toList();
      filteredCities.sort((a, b) => a.city.compareTo(b.city));
    });
  }

  Future<void> selectCity(City selectedCity) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setString('selectedCity',selectedCity.city);
  setState(() {
    isSaved=true;
    for (var city in filteredCities) {
      if (city == selectedCity) {
        city.isSelected = true;
      } else {
        city.isSelected = false;
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton:ElevatedButton(
        onPressed: () {
          // Return the selected city to the previous screen
           selectedCity = filteredCities.firstWhere((city) => city.isSelected, orElse: () {return City(isSelected: false, city: 'Kathmandu', country: 'Nepal');} );
          if(selectedCity.isSelected){
          Navigator.pop(context, selectedCity);
          }else{
            showModalBottomSheet(context: context, builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors:[Color.fromARGB(255, 47, 109, 170),Color.fromARGB(255, 57, 131, 216)] ,begin: Alignment.bottomLeft,end: Alignment.topRight)
                ),
                height:MediaQuery.of(context).size.height*0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Please select a city',style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),onPressed: (){Navigator.pop(context);}, child: const Text('Ok',style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              );
            }
            );
          }
          
        },
        child: Text(isSaved?'Update':'Save'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,          // adapts the height and width according to screen size
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [ Color.fromARGB(255, 100, 181, 246),Color.fromARGB(255, 21, 101, 192),])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150/2),
                        color: Colors.white.withOpacity(0.75)
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text("Select Location",style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xfff7e5b7),
                              ),)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8 ),
              margin: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(24)
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterCities,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search City...',
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredCities.length,
                itemBuilder: (BuildContext context, int index) {
                  final city = filteredCities[index];
                  return Padding(
                    padding: const EdgeInsets.only(left:16.0,right: 16,),
                    child: Card(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.black26,
                      child: ListTile(
                        onTap: (){selectCity(city);},
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        tileColor: const Color.fromARGB(255, 147, 137, 137).withOpacity(0.5),
                        title: Text(city.city),
                        subtitle: Text(city.country),
                        trailing:Image.asset(city.isSelected == true ? 'assets/checked.png' : 'assets/unchecked.png', width: 30,),
      

                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
               