import 'package:bloom/endpoint/endpoint.dart';
import 'package:bloom/endpoint/type_defs.dart';
import 'package:bloom/feature/home/data/model/aqi_model.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:bloom/utils/dio_client.dart';
import 'package:bloom/utils/exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';

class LokaServices {

  final _dio = DioClient();

    FutureEither<AqiLoka> getAqiLocationData(String? lat, String? lng, String? lat2, String? lng2) async {
    try {
    String token = dotenv.env["AQICN_TOKEN"].toString();
      final result = await _dio.get(Endpoint.aqicnMapsUrl(lat, lng, lat2, lng2, token), body: {
        'latlng' : '$lat,$lng,$lat2,$lng2',
        'token' : token
      });
      if (result.statusCode == 200) {
        final response = AqiLoka.fromJson(result.data);
        return Right(response);
      } else {
        return Left(
          ApiException(message: "gagal mendapatkan data")
        );
      }
    } on DioException catch (e) {
      return Left(
        ApiException(message: "terjadi kesalahan : $e")
      );
    }
  }
  
}