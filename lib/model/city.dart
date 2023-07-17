class City {
  bool isSelected;
  final String city;
  final String country;
  

  City({
    required this.isSelected,
    required this.city,
    required this.country,
    
  });

  // List of Cities data
  static List<City> citiesList = [
    City(
      isSelected: false,
      city: 'London',
      country: 'United Kingdom',
      
    ),
    City(
      isSelected: false,
      city: 'Tokyo',
      country: 'Japan',
     
    ),
    City(
      isSelected: false,
      city: 'Delhi',
      country: 'India',
      
    ),
    City(
      isSelected: false,
      city: 'Beijing',
      country: 'China',
      
    ),
    City(
      isSelected: false,
      city: 'Paris',
      country: 'France',
      
    ),
    City(
      isSelected: false,
      city: 'Rome',
      country: 'Italy',
      
    ),
    City(
      isSelected: false,
      city: 'Lagos',
      country: 'Nigeria',
      
    ),
    City(
      isSelected: false,
      city: 'Amsterdam',
      country: 'Netherlands',
      
    ),
    City(
      isSelected: false,
      city: 'Barcelona',
      country: 'Spain',
      
    ),
    City(
      isSelected: false,
      city: 'Miami',
      country: 'United States',
      
    ),
    City(
      isSelected: false,
      city: 'Vienna',
      country: 'Austria',
      
    ),
    City(
      isSelected: false,
      city: 'Berlin',
      country: 'Germany',
      
    ),
    City(
      isSelected: false,
      city: 'Toronto',
      country: 'Canada',
      
    ),
    City(
      isSelected: false,
      city: 'Brussels',
      country: 'Belgium',
      
    ),
    City(
      isSelected: false,
      city: 'Nairobi',
      country: 'Kenya',
      
    ),
    City(
      isSelected: false,
      city: 'Sydney',
      country: 'Australia',
      
    ),
    City(
      isSelected: false,
      city: 'Cairo',
      country: 'Egypt',
      
    ),
    City(
      isSelected: false,
      city: 'Mumbai',
      country: 'India',
      
    ),
    City(
      isSelected: false,
      city: 'New York',
      country: 'United States',
      
    ),
    City(
      isSelected: false,
      city: 'Moscow',
      country: 'Russia',
      
    ),
    City(
      isSelected: false,
      city: 'Rio de Janeiro',
      country: 'Brazil',
      
    ),
    City(
      isSelected: false,
      city: 'Cape Town',
      country: 'South Africa',
      
    ),
    City(
      isSelected: false,
      city: 'Bangkok',
      country: 'Thailand',
      
    ),
    City(
      isSelected: false,
      city: 'Seoul',
      country: 'South Korea',
      
    ),
    City(
      isSelected: false,
      city: 'Istanbul',
      country: 'Turkey',
      
    ),
    City(
      isSelected: false,
      city: 'Dubai',
      country: 'United Arab Emirates',
     
    ),
    City(
      isSelected: false,
      city: 'São Paulo',
      country: 'Brazil',
      
    ),
    City(
      isSelected: false,
      city: 'Shanghai',
      country: 'China',
      
    ),
    City(
      isSelected: false,
      city: 'Karachi',
      country: 'Pakistan',
      
    ),
    City(
      isSelected: false,
      city: 'Ho Chi Minh City',
      country: 'Vietnam',
      
    ),
    City(
      isSelected: false,
      city: 'Kolkata',
      country: 'India',
      
    ),
    City(
      isSelected: false,
      city: 'Jakarta',
      country: 'Indonesia',
      
    ),
    City(
      isSelected: false,
      city: 'Taipei',
      country: 'Taiwan',
      
    ),
    City(
      isSelected: false,
      city: 'Dhaka',
      country: 'Bangladesh',
      
    ),
    City(
      isSelected: false,
      city: 'Manila',
      country: 'Philippines',
      
    ),
    City(
      isSelected: false,
      city: 'Kuala Lumpur',
      country: 'Malaysia',
      
    ),
    City(
      isSelected: false,
      city: 'Singapore',
      country: 'Singapore',
      
    ),
    City(
      isSelected: false,
      city: 'Riyadh',
      country: 'Saudi Arabia',
      
    ),
    City(
      isSelected: false,
      city: 'Tehran',
      country: 'Iran',
      
    ),
    City(
      isSelected: false,
      city: 'Kathmandu',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Pokhara',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Biratnagar',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Lalitpur',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Bharatpur',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Birgunj',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Dharan',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Butwal',
      country: 'Nepal',
      
    ),
    City(
      isSelected: false,
      city: 'Hetauda',
      country: 'Nepal',
      
    ),
  ];

  // Get the selected cities
  static List<City> getSelectedCities() {
    List<City> selectedCities =
        City.citiesList.where((city) => city.isSelected == true).toList();
    return selectedCities;
  }
}
