import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionDetailController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TransactionDetailView'),
          centerTitle: true,
        ),
        body: controller.isLoading ? const Center(child : CircularProgressIndicator()) : ListView(
          children: controller.trackingOrder.history!
              .map((e) => Text(e.note ?? ""))
              .toList(),
        ),
      );
    });
  }
}
