import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../app/const/api_url.dart';
import '../app/data/tracking.dart';

class TrackingServices {
  Future<Tracking> fetchTrackingData() async {
    final response = await http.get(
        Uri.parse('$urlShipment/trackings/JX1541346437/couriers/jnt'),
        headers: {'Authorization': dotenv.get('API_KEY')});

    if (response.statusCode == 200) {
      return Tracking.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to tracking order');
    }
  }
}
