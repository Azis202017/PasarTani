import 'package:get/get.dart';
import 'package:pasartani/services/tracking_services.dart';

import '../../../data/tracking.dart';

class TransactionDetailController extends GetxController {
  Tracking trackingOrder = Tracking();
  @override
  void onReady() {
    fetchOrder();
    super.onReady();
  }
  void fetchOrder() async {
    trackingOrder = await TrackingServices().fetchTrackingData();
    update();
  }
}
