import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/plant_model.dart';

class PlantRepository {
  Future<List<Plant>> getPlant() async {
    final plantUrl = "$baseUrl$plants";
    final client = http.Client();
    var response = await client.get(Uri.parse(plantUrl));

    if (response.statusCode != 200) throw Exception("failed to load info");
    var jsonString = response.body;
    return plantFromJson(jsonString);
  }
}
