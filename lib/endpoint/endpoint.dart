import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoint {
  static String aqicnBaseURL = dotenv.env["AQICN_BASEURL"].toString();

  static String aqicnUrl(String? lat, String? lng, String token) => "$aqicnBaseURL/feed/geo:$lat;$lng/?token=$token";
}