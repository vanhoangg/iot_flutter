import 'package:http/http.dart' as http;
import 'package:iot_flutter/model/history_model.dart';

import '../constants.dart';

class HistoryReposiory {
  Future<List<History>> getHistory() async {
    final infoUrl = "$baseUrl$history";
    final client = new http.Client();
    var response = await client.get(infoUrl);

    if (response.statusCode != 200) throw Exception("failed to load info");
    if (response == null) return null;
    var jsonString = response.body;
    return historyFromJson(jsonString);
  }
}
