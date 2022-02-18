import 'package:freezed_annotation/freezed_annotation.dart';

part 'utils.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result(int value) = Data;
  const factory Result.loading() = Loading;
  const factory Result.error([String? message]) = ErrorDetails;
}