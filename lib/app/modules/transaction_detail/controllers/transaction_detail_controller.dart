import 'package:get/get.dart';
import 'package:pasartani/services/tracking_services.dart';

import '../../../data/tracking.dart';

class TransactionDetailController extends GetxController {
  bool _isLoading = true;
  bool get isLoading  => _isLoading;
  Tracking trackingOrder = Tracking();
  @override
  void onReady() {
    fetchOrder();
    super.onReady();
  }
  void fetchOrder() async {
    trackingOrder = await TrackingServices().fetchTrackingData();
    _isLoading = false;
    update();
  }
}
