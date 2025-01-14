import 'package:album/core/errors/exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  final int statusCode;
  const Failure({required this.message, required this.statusCode});
  @override
  List<Object> get props=>[statusCode,message];

  String get errorMessage=>"$statusCode: $message";
}


class APIFailure extends Failure{
  const APIFailure({required super.message, required super.statusCode});
  APIFailure.fromException(APIException exception):this(statusCode: exception.statusCode,message: exception.message);
}