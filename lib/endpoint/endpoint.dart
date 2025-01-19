import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoint {
  static String aqicnBaseURL = dotenv.env["AQICN_BASEURL"].toString();

  static String aqicnUrl(String? lat, String? lng, String token) => "$aqicnBaseURL/feed/geo:$lat;$lng/?token=$token";
  static String aqicnMapsUrl(String? lat, String? lng, String? lat2, String? lng2, String token) => "https://api.waqi.info/v2/map/bounds?latlng=$lat,$lng,$lat2,$lng2&networks=all&token=$token";
}