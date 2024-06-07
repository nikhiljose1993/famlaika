class Country {
  final String name;
  final String flag;
  final String phoneCode;

  Country({required this.name, required this.flag, required this.phoneCode});
}

List<Country> countries = [
  Country(
      name: 'United Arab Emirates',
      flag: 'assets/flags/uae.svg',
      phoneCode: '+971'),
  Country(
      name: 'Saudi Arabia', flag: 'assets/flags/saudi.svg', phoneCode: '+966'),
  Country(name: 'India', flag: 'assets/flags/india.svg', phoneCode: '+91'),
];

Country defaultCountry =
    countries.firstWhere((country) => country.name == 'India');
