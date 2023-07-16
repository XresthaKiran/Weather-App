class City {
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;

  City({
    required this.isSelected,
    required this.city,
    required this.country,
    required this.isDefault,
  });

  // List of Cities data
  static List<City> citiesList = [
    City(
      isSelected: false,
      city: 'London',
      country: 'United Kingdom',
      isDefault: true,
    ),
    City(
      isSelected: false,
      city: 'Tokyo',
      country: 'Japan',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Delhi',
      country: 'India',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Beijing',
      country: 'China',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Paris',
      country: 'France',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Rome',
      country: 'Italy',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Lagos',
      country: 'Nigeria',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Amsterdam',
      country: 'Netherlands',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Barcelona',
      country: 'Spain',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Miami',
      country: 'United States',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Vienna',
      country: 'Austria',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Berlin',
      country: 'Germany',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Toronto',
      country: 'Canada',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Brussels',
      country: 'Belgium',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Nairobi',
      country: 'Kenya',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Sydney',
      country: 'Australia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Cairo',
      country: 'Egypt',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Mumbai',
      country: 'India',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'New York',
      country: 'United States',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Moscow',
      country: 'Russia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Rio de Janeiro',
      country: 'Brazil',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Cape Town',
      country: 'South Africa',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Bangkok',
      country: 'Thailand',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Seoul',
      country: 'South Korea',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Istanbul',
      country: 'Turkey',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Dubai',
      country: 'United Arab Emirates',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'São Paulo',
      country: 'Brazil',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Shanghai',
      country: 'China',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Karachi',
      country: 'Pakistan',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Ho Chi Minh City',
      country: 'Vietnam',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Kolkata',
      country: 'India',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Jakarta',
      country: 'Indonesia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Taipei',
      country: 'Taiwan',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Dhaka',
      country: 'Bangladesh',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Manila',
      country: 'Philippines',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Kuala Lumpur',
      country: 'Malaysia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Singapore',
      country: 'Singapore',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Riyadh',
      country: 'Saudi Arabia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Tehran',
      country: 'Iran',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Kathmandu',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Pokhara',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Biratnagar',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Lalitpur',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Bharatpur',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Birgunj',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Dharan',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Butwal',
      country: 'Nepal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Hetauda',
      country: 'Nepal',
      isDefault: false,
    ),
  ];

  // Get the selected cities
  static List<City> getSelectedCities() {
    List<City> selectedCities =
        City.citiesList.where((city) => city.isSelected == true).toList();
    return selectedCities;
  }
}
