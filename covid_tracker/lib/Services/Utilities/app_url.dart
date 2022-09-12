// ignore_for_file: prefer_interpolation_to_compose_strings

class Appurl {
  //THIS IS THE BASE URL
  static const String baseUrl = 'https://disease.sh/v3/covid-19/all';
  static const String baseUrlCountries = 'https://disease.sh/v3/covid-19/';

  //FOR FETCHING THE COVID STATES
  static const String worldStateApi = baseUrl + 'all';
  static const String countriesList = "https://disease.sh/v3/covid-19/countries";
}
