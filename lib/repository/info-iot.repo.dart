import 'package:http/http.dart' as http;

import '../model/info-iot_model.dart';

class InfoIotRepository {
  Future<List<InfoIot>> fetchBanners({String url}) async {
    final infoUrl = url;
    final client = new http.Client();
    var response = await client.get(infoUrl);

    if (response.statusCode != 200) throw Exception("failed to load info");
    if (response == null) return null;
    var jsonString = response.body;
    return infoIotFromJson(jsonString);
  }
}
