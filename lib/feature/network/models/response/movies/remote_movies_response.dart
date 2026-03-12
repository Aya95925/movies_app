// import 'package:equatable/equatable.dart';

import 'remote_data.dart';
import 'remote_meta.dart';

class RemoteMoviesResponse {
  final String? status;
  final String? statusMessage;
  final RemoteData? data;
  final RemoteMeta? meta;

  const RemoteMoviesResponse({this.status, this.statusMessage, this.data, this.meta});

  factory RemoteMoviesResponse.fromJson(Map<String, dynamic> json) => RemoteMoviesResponse(
    status: json['status'] as String?,
    statusMessage: json['status_message'] as String?,
    data: json['data'] == null
        ? null
        : RemoteData.fromJson(json['data'] as Map<String, dynamic>),
    meta: json['@meta'] == null
        ? null
        : RemoteMeta.fromJson(json['@meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'status_message': statusMessage,
    'data': data?.toJson(),
    '@meta': meta?.toJson(),
  };

}
