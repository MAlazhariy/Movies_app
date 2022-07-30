import 'package:movies/core/network/server_error_model.dart';

class ServerException implements Exception {
  final ServerErrorModel model;

  ServerException({required this.model});
}