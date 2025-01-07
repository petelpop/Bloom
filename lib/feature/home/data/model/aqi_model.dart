import 'dart:convert';

class AqiModel {
    final String? status;
    final AqiDataModel? data;

    AqiModel({
        this.status,
        this.data,
    });

    AqiModel copyWith({
        String? status,
        AqiDataModel? data,
    }) => 
        AqiModel(
            status: status ?? this.status,
            data: data ?? this.data,
        );

    factory AqiModel.fromRawJson(String str) => AqiModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AqiModel.fromJson(Map<String, dynamic> json) => AqiModel(
        status: json["status"],
        data: json["data"] == null ? null : AqiDataModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class AqiDataModel {
    final int? aqi;
    final int? idx;
    final List<Attribution>? attributions;
    final City? city;
    final String? dominentpol;


    AqiDataModel({
        this.aqi,
        this.idx,
        this.attributions,
        this.city,
        this.dominentpol,

    });

    AqiDataModel copyWith({
        int? aqi,
        int? idx,
        List<Attribution>? attributions,
        City? city,
        String? dominentpol,

    }) => 
        AqiDataModel(
            aqi: aqi ?? this.aqi,
            idx: idx ?? this.idx,
            attributions: attributions ?? this.attributions,
            city: city ?? this.city,
            dominentpol: dominentpol ?? this.dominentpol,

        );

    factory AqiDataModel.fromRawJson(String str) => AqiDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AqiDataModel.fromJson(Map<String, dynamic> json) => AqiDataModel(
        aqi: json["aqi"],
        idx: json["idx"],
        attributions: json["attributions"] == null ? [] : List<Attribution>.from(json["attributions"]!.map((x) => Attribution.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],

    );

    Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "attributions": attributions == null ? [] : List<dynamic>.from(attributions!.map((x) => x.toJson())),
        "city": city?.toJson(),
        "dominentpol": dominentpol,
    };
}

class Attribution {
    final String? url;
    final String? name;
    final String? logo;

    Attribution({
        this.url,
        this.name,
        this.logo,
    });

    Attribution copyWith({
        String? url,
        String? name,
        String? logo,
    }) => 
        Attribution(
            url: url ?? this.url,
            name: name ?? this.name,
            logo: logo ?? this.logo,
        );

    factory Attribution.fromRawJson(String str) => Attribution.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        url: json["url"],
        name: json["name"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "logo": logo,
    };
}

class City {
    final List<double>? geo;
    final String? name;
    final String? url;
    final String? location;

    City({
        this.geo,
        this.name,
        this.url,
        this.location,
    });

    City copyWith({
        List<double>? geo,
        String? name,
        String? url,
        String? location,
    }) => 
        City(
            geo: geo ?? this.geo,
            name: name ?? this.name,
            url: url ?? this.url,
            location: location ?? this.location,
        );

    factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory City.fromJson(Map<String, dynamic> json) => City(
        geo: json["geo"] == null ? [] : List<double>.from(json["geo"]!.map((x) => x?.toDouble())),
        name: json["name"],
        url: json["url"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "geo": geo == null ? [] : List<dynamic>.from(geo!.map((x) => x)),
        "name": name,
        "url": url,
        "location": location,
    };
}
