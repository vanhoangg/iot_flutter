import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/history_model.dart';

class HistoryReposiory {
  Future<List<History>> getHistory({required String token}) async {
    final infoUrl = "$baseUrl$history";
    final client = http.Client();
    var response = await client.get(Uri.parse(infoUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode != 200) throw Exception("failed to load info");
    var jsonString = response.body;
    return historyFromJson(jsonString);
  }
}
