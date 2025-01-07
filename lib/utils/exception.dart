import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception{
  const ApiException({required this.message, this.responseCode = false});

  final String message;
  final bool responseCode;

  @override
  List<Object?> get props => [message, responseCode];

}