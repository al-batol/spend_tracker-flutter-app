// lib/data/models/result_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResultModel<T> {
  final bool success;
  final String message;
  final T? data;
  final Map<String, dynamic>? errors;

  ResultModel({
    required this.success,
    required this.message,
    this.data,
    this.errors,
  });

  factory ResultModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ResultModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResultModelToJson(this, toJsonT);
}
