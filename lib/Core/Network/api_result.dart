<<<<<<< HEAD
import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_handele_error.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Sucscess<T>;
  const factory ApiResult.failure(ErrorHandler errorHand) = Failure<T>;
}
=======
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'api_handele_error.dart';
//
// part 'api_result.freezed.dart';
//
// @Freezed()
// abstract class ApiResult <T>  with _$ApiResult<T>{
//
//   const factory ApiResult.success(T data) = Sucscess<T>;
//   const factory ApiResult.failure(ErrorHandler errorHand) = Failure<T>;
//
// }
>>>>>>> b59bc0e0c30810bbf52f75671c3352d782c29bc0
