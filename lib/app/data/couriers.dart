
import 'dart:convert';

Couriers couriersFromJson(String str) => Couriers.fromJson(json.decode(str));

String couriersToJson(Couriers data) => json.encode(data.toJson());

class Couriers {
    Couriers({
        this.availableForCashOnDelivery,
        this.availableForProofOfDelivery,
        this.availableForInstantWaybillId,
        this.courierName,
        this.courierCode,
        this.courierServiceName,
        this.courierServiceCode,
        this.tier,
        this.description,
        this.serviceType,
        this.shippingType,
        this.shipmentDurationRange,
        this.shipmentDurationUnit,
    });

    bool? availableForCashOnDelivery;
    bool? availableForProofOfDelivery;
    bool? availableForInstantWaybillId;
    String? courierName;
    String? courierCode;
    String? courierServiceName;
    String? courierServiceCode;
    String? tier;
    String? description;
    String? serviceType;
    String? shippingType;
    String? shipmentDurationRange;
    String? shipmentDurationUnit;

    factory Couriers.fromJson(Map<String, dynamic> json) => Couriers(
        availableForCashOnDelivery: json["available_for_cash_on_delivery"],
        availableForProofOfDelivery: json["available_for_proof_of_delivery"],
        availableForInstantWaybillId: json["available_for_instant_waybill_id"],
        courierName: json["courier_name"],
        courierCode: json["courier_code"],
        courierServiceName: json["courier_service_name"],
        courierServiceCode: json["courier_service_code"],
        tier: json["tier"],
        description: json["description"],
        serviceType: json["service_type"],
        shippingType: json["shipping_type"],
        shipmentDurationRange: json["shipment_duration_range"],
        shipmentDurationUnit: json["shipment_duration_unit"],
    );

    Map<String, dynamic> toJson() => {
        "available_for_cash_on_delivery": availableForCashOnDelivery,
        "available_for_proof_of_delivery": availableForProofOfDelivery,
        "available_for_instant_waybill_id": availableForInstantWaybillId,
        "courier_name": courierName,
        "courier_code": courierCode,
        "courier_service_name": courierServiceName,
        "courier_service_code": courierServiceCode,
        "tier": tier,
        "description": description,
        "service_type": serviceType,
        "shipping_type": shippingType,
        "shipment_duration_range": shipmentDurationRange,
        "shipment_duration_unit": shipmentDurationUnit,
    };
}
