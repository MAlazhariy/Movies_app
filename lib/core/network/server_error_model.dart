import 'package:equatable/equatable.dart';

class ServerErrorModel extends Equatable {
  final String message;
  final int code;

  const ServerErrorModel({
    required this.message,
    required this.code,
  });

  @override
  List<Object?> get props => [
    message,
    code,
  ];

  ServerErrorModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        code = json['code'];
}