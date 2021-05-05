import 'package:http/http.dart' as http;
import 'package:iot_flutter/constants.dart';
import 'package:iot_flutter/model/info-iot_model.dart';

class InfoIotRepository {
  Future<List<InfoIot>> fetchBanners() async {
    final infoUrl = "$baseUrl$infoIots";
    final client = new http.Client();
    var response = await client.get(infoUrl);

    if (response.statusCode != 200) throw Exception("failed to load info");
    if (response == null) return null;
    var jsonString = response.body;
    return infoIotFromJson(jsonString);
  }
}
