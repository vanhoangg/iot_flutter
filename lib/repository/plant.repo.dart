import 'package:iot_flutter/model/plant-model.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class PlantRepository {
  Future<List<Plant>> getPlant() async {
    final plantUrl = "$baseUrl$plants";
    final client = new http.Client();
    var response = await client.get(plantUrl);

    if (response.statusCode != 200) throw Exception("failed to load info");
    if (response == null) return null;
    var jsonString = response.body;
    return plantFromJson(jsonString);
  }
}
