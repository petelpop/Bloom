import 'dart:convert';

class AqiLoka {
    final String? status;
    final List<AqiLokaDataModel>? data;

    AqiLoka({
        this.status,
        this.data,
    });

    AqiLoka copyWith({
        String? status,
        List<AqiLokaDataModel>? data,
    }) => 
        AqiLoka(
            status: status ?? this.status,
            data: data ?? this.data,
        );

    factory AqiLoka.fromRawJson(String str) => AqiLoka.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AqiLoka.fromJson(Map<String, dynamic> json) => AqiLoka(
        status: json["status"],
        data: json["data"] == null ? [] : List<AqiLokaDataModel>.from(json["data"]!.map((x) => AqiLokaDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AqiLokaDataModel {
    final double? lat;
    final double? lon;
    final int? uid;
    final String? aqi;
    final Station? station;

    AqiLokaDataModel({
        this.lat,
        this.lon,
        this.uid,
        this.aqi,
        this.station,
    });

    AqiLokaDataModel copyWith({
        double? lat,
        double? lon,
        int? uid,
        String? aqi,
        Station? station,
    }) => 
        AqiLokaDataModel(
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            uid: uid ?? this.uid,
            aqi: aqi ?? this.aqi,
            station: station ?? this.station,
        );

    factory AqiLokaDataModel.fromRawJson(String str) => AqiLokaDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AqiLokaDataModel.fromJson(Map<String, dynamic> json) => AqiLokaDataModel(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        uid: json["uid"],
        aqi: json["aqi"],
        station: json["station"] == null ? null : Station.fromJson(json["station"]),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "uid": uid,
        "aqi": aqi,
        "station": station?.toJson(),
    };
}

class Station {
    final String? name;
    final DateTime? time;

    Station({
        this.name,
        this.time,
    });

    Station copyWith({
        String? name,
        DateTime? time,
    }) => 
        Station(
            name: name ?? this.name,
            time: time ?? this.time,
        );

    factory Station.fromRawJson(String str) => Station.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Station.fromJson(Map<String, dynamic> json) => Station(
        name: json["name"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "time": time?.toIso8601String(),
    };
}
