import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasartani/app/const/api_url.dart';
import 'package:pasartani/app/data/couriers.dart';
import 'couriers_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async{
   await dotenv.load(fileName: ".env"); 
  group('fetch couriers', () {
    test('returns an Couriers if the http call completes successfully', () async {
      final client = MockClient();

    
      when(
        client.get(Uri.parse('$urlShipment/couriers'),
            headers: {
              'Authorization':
                   dotenv.get('API_KEY')
            }),
      ).thenAnswer((_) async => http.Response(
          '{ "available_for_cash_on_delivery": false, "available_for_proof_of_delivery": false,"available_for_instant_waybill_id": true,"courier_name": "Gojek","courier_code": "gojek","courier_service_name": "Instant","courier_service_code": "instant","tier": "premium","description": "On Demand Instant (bike)","service_type": "same_day","shipping_type": "parcel","shipment_duration_range": "1 - 3","shipment_duration_unit": "hours"}',
          200));

      expect(await fetchCouriers(client), isA<Couriers>());
    });
    
  });
}

Future<Couriers> fetchCouriers(http.Client client) async {
  final response =
      await client.get(Uri.parse('$urlShipment/couriers'), headers: {
    'Authorization':
        dotenv.get('API_KEY')
  });

  if (response.statusCode == 200) {
   
    return Couriers.fromJson(jsonDecode(response.body));
  } else {
 
    throw Exception('Failed to load couriers');
  }
}
