import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasartani/app/const/api_url.dart';
import 'package:pasartani/app/data/area.dart';
import 'area_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  await dotenv.load(fileName: ".env");
  group('fetch Area Maps', () {
    test('returns an Area if the http call completes successfully', () async {
      final client = MockClient();

      when(
        client.get(
            Uri.parse(
                '$urlShipment/maps/areas/?=countries=ID&input=Jakarta+Pusat&type=single'),
            headers: {'Authorization': dotenv.get('API_KEY')}),
      ).thenAnswer((_) async => http.Response(
          '{"id": "IDNP6IDNC147IDND829IDZ10110","name": "Gambir, Jakarta Pusat, DKI Jakarta. 10110","country_name": "Indonesia","country_code": "ID","administrative_division_level_1_name": "DKI Jakarta","administrative_division_level_1_type": "province","administrative_division_level_2_name": "Jakarta Pusat","administrative_division_level_2_type": "city","administrative_division_level_3_name": "Gambir","administrative_division_level_3_type": "district","postal_code": 10110}',
          200));

      expect(await fetchArea(client), isA<Area>());
    });
  });
}

Future<Area> fetchArea(http.Client client) async {
  final response = await client.get(
      Uri.parse(
          '$urlShipment/maps/areas/?=countries=ID&input=Jakarta+Pusat&type=single'),
      headers: {
        'Authorization':
             dotenv.get('API_KEY')
      });


  if (response.statusCode == 200) {
    return Area.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load area');
  }
}
