import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/history_model.dart';

class HistoryReposiory {
  Future<List<History>> getHistory({String token}) async {
    final infoUrl = "$baseUrl$history";
    final client = new http.Client();
    var response = await client.get(infoUrl, headers: {
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);

    if (response.statusCode != 200) throw Exception("failed to load info");
    if (response == null) return null;
    var jsonString = response.body;
    return historyFromJson(jsonString);
  }
}
