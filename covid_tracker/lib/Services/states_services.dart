import 'dart:convert';

import 'package:covid_tracker/Models/world_state_model.dart';
import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStateModel> getWorldStateData() async {
    final response = await http.get(Uri.parse(Appurl.baseUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception("Something went Wrong");
    }
  }

  Future<List<dynamic>> getCountriesStateData() async {
    final response = await http.get(Uri.parse(Appurl.countriesList));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Something went Wrong");
    }
  }
}
