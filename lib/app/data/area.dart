

class Area {
    Area({
        this.id,
        this.name,
        this.countryName,
        this.countryCode,
        this.administrativeDivisionLevel1Name,
        this.administrativeDivisionLevel1Type,
        this.administrativeDivisionLevel2Name,
        this.administrativeDivisionLevel2Type,
        this.administrativeDivisionLevel3Name,
        this.administrativeDivisionLevel3Type,
        this.postalCode,
    });

    String? id;
    String? name;
    String? countryName;
    String? countryCode;
    String? administrativeDivisionLevel1Name;
    String? administrativeDivisionLevel1Type;
    String? administrativeDivisionLevel2Name;
    String? administrativeDivisionLevel2Type;
    String? administrativeDivisionLevel3Name;
    String? administrativeDivisionLevel3Type;
    int? postalCode;

    Area copyWith({
        String? id,
        String? name,
        String? countryName,
        String? countryCode,
        String? administrativeDivisionLevel1Name,
        String? administrativeDivisionLevel1Type,
        String? administrativeDivisionLevel2Name,
        String? administrativeDivisionLevel2Type,
        String? administrativeDivisionLevel3Name,
        String? administrativeDivisionLevel3Type,
        int? postalCode,
    }) => 
        Area(
            id: id ?? this.id,
            name: name ?? this.name,
            countryName: countryName ?? this.countryName,
            countryCode: countryCode ?? this.countryCode,
            administrativeDivisionLevel1Name: administrativeDivisionLevel1Name ?? this.administrativeDivisionLevel1Name,
            administrativeDivisionLevel1Type: administrativeDivisionLevel1Type ?? this.administrativeDivisionLevel1Type,
            administrativeDivisionLevel2Name: administrativeDivisionLevel2Name ?? this.administrativeDivisionLevel2Name,
            administrativeDivisionLevel2Type: administrativeDivisionLevel2Type ?? this.administrativeDivisionLevel2Type,
            administrativeDivisionLevel3Name: administrativeDivisionLevel3Name ?? this.administrativeDivisionLevel3Name,
            administrativeDivisionLevel3Type: administrativeDivisionLevel3Type ?? this.administrativeDivisionLevel3Type,
            postalCode: postalCode ?? this.postalCode,
        );

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        countryName: json["country_name"],
        countryCode: json["country_code"],
        administrativeDivisionLevel1Name: json["administrative_division_level_1_name"],
        administrativeDivisionLevel1Type: json["administrative_division_level_1_type"],
        administrativeDivisionLevel2Name: json["administrative_division_level_2_name"],
        administrativeDivisionLevel2Type: json["administrative_division_level_2_type"],
        administrativeDivisionLevel3Name: json["administrative_division_level_3_name"],
        administrativeDivisionLevel3Type: json["administrative_division_level_3_type"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_name": countryName,
        "country_code": countryCode,
        "administrative_division_level_1_name": administrativeDivisionLevel1Name,
        "administrative_division_level_1_type": administrativeDivisionLevel1Type,
        "administrative_division_level_2_name": administrativeDivisionLevel2Name,
        "administrative_division_level_2_type": administrativeDivisionLevel2Type,
        "administrative_division_level_3_name": administrativeDivisionLevel3Name,
        "administrative_division_level_3_type": administrativeDivisionLevel3Type,
        "postal_code": postalCode,
    };
}
