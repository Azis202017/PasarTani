import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasartani/app/const/api_url.dart';
import 'package:pasartani/app/data/tracking.dart';
import 'area_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  await dotenv.load(fileName: ".env");
  group('fetch tracking ', () {
    test('returns an tracking if the http call completes successfully', () async {
      final client = MockClient();

      when(
        client.get(
            Uri.parse(
                '$urlShipment/trackings/JX1541346437/couriers/jnt'),
            headers: {'Authorization': dotenv.get('API_KEY')}),
      ).thenAnswer((_) async => http.Response(
          '{"success":true,"messsage":"Successfully get tracking info","object":"tracking","id":"6435176f76ca6c432ce15976","waybill_id":"JX1541346437","courier":{"company":"jnt"},"origin":{"contact_name":"PANARYBODY_SHOES","address":"JAWA TIMUR, SURABAYA, jl.margomulyo pergudangan mm41 gudang No.41B. "},"destination":{"contact_name":"Abdul Azis Al Ayubbi","address":"JAWA BARAT, SOREANG, Pondok 4, Jl Ter Buahbatu gg Desa no. 79 Lengkong, Lengkong kamar no 6. "},"history":[{"note":"Manifes","updated_at":"2023-03-09T08:12:00+07:00","status":"allocated"},{"note":"Paket telah diterima oleh SUKOMANUNGGAL","updated_at":"2023-03-09T15:43:00+07:00","status":"picked"},{"note":"Paket akan dikirimkan ke SUB_GATEWAY","updated_at":"2023-03-09T17:37:00+07:00","status":"dropping_off"},{"note":"Paket telah sampai di SUB_GATEWAY","updated_at":"2023-03-09T19:21:00+07:00","status":"dropping_off"},{"note":"Paket telah sampai di SUB_GATEWAY","updated_at":"2023-03-09T19:47:00+07:00","status":"dropping_off"},{"note":"Paket akan dikirimkan ke BDO_GATEWAY","updated_at":"2023-03-09T19:50:00+07:00","status":"dropping_off"},{"note":"Paket akan dikirimkan ke BDO_GATEWAY","updated_at":"2023-03-09T20:01:00+07:00","status":"dropping_off"},{"note":"Paket telah sampai di BDO_GATEWAY","updated_at":"2023-03-10T15:15:00+07:00","status":"dropping_off"},{"note":"Paket akan dikirimkan ke DC_CIJAGRA","updated_at":"2023-03-10T16:59:00+07:00","status":"dropping_off"},{"note":"Paket telah sampai di DC_CIJAGRA","updated_at":"2023-03-11T00:53:00+07:00","status":"dropping_off"},{"note":"Paket akan dikirim ke alamat penerima","updated_at":"2023-03-11T09:05:00+07:00","status":"dropping_off"},{"note":"Paket telah diterima","updated_at":"2023-03-11T11:30:00+07:00","status":"delivered"}],"status":"delivered"}',
          200));

      expect(await fetchTracking(client), isA<Tracking>());
    });
  });
}

Future<Tracking> fetchTracking(http.Client client) async {
  final response = await client.get(
      Uri.parse(
          '$urlShipment/trackings/JX1541346437/couriers/jnt'),
      headers: {
        'Authorization':
             dotenv.get('API_KEY')
      });


  if (response.statusCode == 200) {
    return Tracking.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to tracking order');
  }
}
