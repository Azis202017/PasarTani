import 'dart:convert';

Tracking trackingFromJson(String str) => Tracking.fromJson(json.decode(str));

String trackingToJson(Tracking data) => json.encode(data.toJson());

class Tracking {
    Tracking({
        this.success,
        this.messsage,
        this.object,
        this.id,
        this.waybillId,
        this.courier,
        this.origin,
        this.destination,
        this.history,
        this.status,
    });

    bool? success;
    String? messsage;
    String? object;
    String? id;
    String? waybillId;
    Courier? courier;
    Destination? origin;
    Destination? destination;
    List<History>? history;
    String? status;

    factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
        success: json["success"],
        messsage: json["messsage"],
        object: json["object"],
        id: json["id"],
        waybillId: json["waybill_id"],
        courier: json["courier"] == null ? null : Courier.fromJson(json["courier"]),
        origin: json["origin"] == null ? null : Destination.fromJson(json["origin"]),
        destination: json["destination"] == null ? null : Destination.fromJson(json["destination"]),
        history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "messsage": messsage,
        "object": object,
        "id": id,
        "waybill_id": waybillId,
        "courier": courier?.toJson(),
        "origin": origin?.toJson(),
        "destination": destination?.toJson(),
        "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
        "status": status,
    };
}

class Courier {
    Courier({
        this.company,
    });

    String? company;

    factory Courier.fromJson(Map<String, dynamic> json) => Courier(
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "company": company,
    };
}

class Destination {
    Destination({
        this.contactName,
        this.address,
    });

    String? contactName;
    String? address;

    factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        contactName: json["contact_name"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "contact_name": contactName,
        "address": address,
    };
}

class History {
    History({
        this.note,
        this.updatedAt,
        this.status,
    });

    String? note;
    DateTime? updatedAt;
    String? status;

    factory History.fromJson(Map<String, dynamic> json) => History(
        note: json["note"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "note": note,
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
    };
}
