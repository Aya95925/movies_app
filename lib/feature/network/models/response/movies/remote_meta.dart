// import 'package:equatable/equatable.dart';

class RemoteMeta {
  final int? apiVersion;
  final String? executionTime;

  const RemoteMeta({this.apiVersion, this.executionTime});

  factory RemoteMeta.fromJson(Map<String, dynamic> json) => RemoteMeta(
    apiVersion: json['api_version'] as int?,
    executionTime: json['execution_time'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'api_version': apiVersion,
    'execution_time': executionTime,
  };

}
