import 'package:http/http.dart' as http;

import '../model/info_iot_model.dart';

class InfoIotRepository {
  Future<List<InfoIot>> fetchBanners({required String url}) async {
    final infoUrl = url;
    final client = http.Client();
    var response = await client.get(Uri.parse(infoUrl));

    if (response.statusCode != 200) throw Exception("failed to load info");
    var jsonString = response.body;
    return infoIotFromJson(jsonString);
  }
}
