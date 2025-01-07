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
    final Iaqi? iaqi;
    final Time? time;
    final Forecast? forecast;
    final Debug? debug;

    AqiDataModel({
        this.aqi,
        this.idx,
        this.attributions,
        this.city,
        this.dominentpol,
        this.iaqi,
        this.time,
        this.forecast,
        this.debug,
    });

    AqiDataModel copyWith({
        int? aqi,
        int? idx,
        List<Attribution>? attributions,
        City? city,
        String? dominentpol,
        Iaqi? iaqi,
        Time? time,
        Forecast? forecast,
        Debug? debug,
    }) => 
        AqiDataModel(
            aqi: aqi ?? this.aqi,
            idx: idx ?? this.idx,
            attributions: attributions ?? this.attributions,
            city: city ?? this.city,
            dominentpol: dominentpol ?? this.dominentpol,
            iaqi: iaqi ?? this.iaqi,
            time: time ?? this.time,
            forecast: forecast ?? this.forecast,
            debug: debug ?? this.debug,
        );

    factory AqiDataModel.fromRawJson(String str) => AqiDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AqiDataModel.fromJson(Map<String, dynamic> json) => AqiDataModel(
        aqi: json["aqi"],
        idx: json["idx"],
        attributions: json["attributions"] == null ? [] : List<Attribution>.from(json["attributions"]!.map((x) => Attribution.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],
        iaqi: json["iaqi"] == null ? null : Iaqi.fromJson(json["iaqi"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
        debug: json["debug"] == null ? null : Debug.fromJson(json["debug"]),
    );

    Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "attributions": attributions == null ? [] : List<dynamic>.from(attributions!.map((x) => x.toJson())),
        "city": city?.toJson(),
        "dominentpol": dominentpol,
        "iaqi": iaqi?.toJson(),
        "time": time?.toJson(),
        "forecast": forecast?.toJson(),
        "debug": debug?.toJson(),
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

class Debug {
    final DateTime? sync;

    Debug({
        this.sync,
    });

    Debug copyWith({
        DateTime? sync,
    }) => 
        Debug(
            sync: sync ?? this.sync,
        );

    factory Debug.fromRawJson(String str) => Debug.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: json["sync"] == null ? null : DateTime.parse(json["sync"]),
    );

    Map<String, dynamic> toJson() => {
        "sync": sync?.toIso8601String(),
    };
}

class Forecast {
    final Daily? daily;

    Forecast({
        this.daily,
    });

    Forecast copyWith({
        Daily? daily,
    }) => 
        Forecast(
            daily: daily ?? this.daily,
        );

    factory Forecast.fromRawJson(String str) => Forecast.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );

    Map<String, dynamic> toJson() => {
        "daily": daily?.toJson(),
    };
}

class Daily {
    final List<O3>? o3;
    final List<O3>? pm10;
    final List<O3>? pm25;
    final List<O3>? uvi;

    Daily({
        this.o3,
        this.pm10,
        this.pm25,
        this.uvi,
    });

    Daily copyWith({
        List<O3>? o3,
        List<O3>? pm10,
        List<O3>? pm25,
        List<O3>? uvi,
    }) => 
        Daily(
            o3: o3 ?? this.o3,
            pm10: pm10 ?? this.pm10,
            pm25: pm25 ?? this.pm25,
            uvi: uvi ?? this.uvi,
        );

    factory Daily.fromRawJson(String str) => Daily.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        o3: json["o3"] == null ? [] : List<O3>.from(json["o3"]!.map((x) => O3.fromJson(x))),
        pm10: json["pm10"] == null ? [] : List<O3>.from(json["pm10"]!.map((x) => O3.fromJson(x))),
        pm25: json["pm25"] == null ? [] : List<O3>.from(json["pm25"]!.map((x) => O3.fromJson(x))),
        uvi: json["uvi"] == null ? [] : List<O3>.from(json["uvi"]!.map((x) => O3.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "o3": o3 == null ? [] : List<dynamic>.from(o3!.map((x) => x.toJson())),
        "pm10": pm10 == null ? [] : List<dynamic>.from(pm10!.map((x) => x.toJson())),
        "pm25": pm25 == null ? [] : List<dynamic>.from(pm25!.map((x) => x.toJson())),
        "uvi": uvi == null ? [] : List<dynamic>.from(uvi!.map((x) => x.toJson())),
    };
}

class O3 {
    final int? avg;
    final DateTime? day;
    final int? max;
    final int? min;

    O3({
        this.avg,
        this.day,
        this.max,
        this.min,
    });

    O3 copyWith({
        int? avg,
        DateTime? day,
        int? max,
        int? min,
    }) => 
        O3(
            avg: avg ?? this.avg,
            day: day ?? this.day,
            max: max ?? this.max,
            min: min ?? this.min,
        );

    factory O3.fromRawJson(String str) => O3.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory O3.fromJson(Map<String, dynamic> json) => O3(
        avg: json["avg"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        max: json["max"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "avg": avg,
        "day": "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "max": max,
        "min": min,
    };
}

class Iaqi {
    final Dew? dew;
    final Dew? h;
    final Dew? p;
    final Dew? pm25;
    final Dew? t;
    final Dew? w;

    Iaqi({
        this.dew,
        this.h,
        this.p,
        this.pm25,
        this.t,
        this.w,
    });

    Iaqi copyWith({
        Dew? dew,
        Dew? h,
        Dew? p,
        Dew? pm25,
        Dew? t,
        Dew? w,
    }) => 
        Iaqi(
            dew: dew ?? this.dew,
            h: h ?? this.h,
            p: p ?? this.p,
            pm25: pm25 ?? this.pm25,
            t: t ?? this.t,
            w: w ?? this.w,
        );

    factory Iaqi.fromRawJson(String str) => Iaqi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Iaqi.fromJson(Map<String, dynamic> json) => Iaqi(
        dew: json["dew"] == null ? null : Dew.fromJson(json["dew"]),
        h: json["h"] == null ? null : Dew.fromJson(json["h"]),
        p: json["p"] == null ? null : Dew.fromJson(json["p"]),
        pm25: json["pm25"] == null ? null : Dew.fromJson(json["pm25"]),
        t: json["t"] == null ? null : Dew.fromJson(json["t"]),
        w: json["w"] == null ? null : Dew.fromJson(json["w"]),
    );

    Map<String, dynamic> toJson() => {
        "dew": dew?.toJson(),
        "h": h?.toJson(),
        "p": p?.toJson(),
        "pm25": pm25?.toJson(),
        "t": t?.toJson(),
        "w": w?.toJson(),
    };
}

class Dew {
    final int? v;

    Dew({
        this.v,
    });

    Dew copyWith({
        int? v,
    }) => 
        Dew(
            v: v ?? this.v,
        );

    factory Dew.fromRawJson(String str) => Dew.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dew.fromJson(Map<String, dynamic> json) => Dew(
        v: json["v"],
    );

    Map<String, dynamic> toJson() => {
        "v": v,
    };
}

class Time {
    final DateTime? s;
    final String? tz;
    final int? v;
    final DateTime? iso;

    Time({
        this.s,
        this.tz,
        this.v,
        this.iso,
    });

    Time copyWith({
        DateTime? s,
        String? tz,
        int? v,
        DateTime? iso,
    }) => 
        Time(
            s: s ?? this.s,
            tz: tz ?? this.tz,
            v: v ?? this.v,
            iso: iso ?? this.iso,
        );

    factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: json["s"] == null ? null : DateTime.parse(json["s"]),
        tz: json["tz"],
        v: json["v"],
        iso: json["iso"] == null ? null : DateTime.parse(json["iso"]),
    );

    Map<String, dynamic> toJson() => {
        "s": s?.toIso8601String(),
        "tz": tz,
        "v": v,
        "iso": iso?.toIso8601String(),
    };
}
