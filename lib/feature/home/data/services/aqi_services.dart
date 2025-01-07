import 'package:bloom/endpoint/endpoint.dart';
import 'package:bloom/endpoint/type_defs.dart';
import 'package:bloom/feature/home/data/model/aqi_model.dart';
import 'package:bloom/utils/dio_client.dart';
import 'package:bloom/utils/exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';

class AqiServices {
  final _dio = DioClient();

  FutureEither<AqiModel> getAqiData(String? lat, String? lng) async {
    try {
    String token = dotenv.env["AQICN_TOKEN"].toString();
      final result = await _dio.get(Endpoint.aqicnUrl(lat, lng, token), body: {
        'lat' : lat,
        'lng' : lng,
        'token' : token
      });
      if (result.statusCode == 200) {
        final response = AqiModel.fromJson(result.data);
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