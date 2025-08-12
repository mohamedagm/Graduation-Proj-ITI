import 'dart:io';
import 'package:dio/dio.dart';
import 'package:iti_project/core/errors/failures.dart';

class DioProductsExceptions extends Failures {
  DioProductsExceptions(super.errMessage);

  factory DioProductsExceptions.fromDioError(DioException dioError) {
    final statusCode = dioError.response?.statusCode ?? 0;

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DioProductsExceptions("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return DioProductsExceptions("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return DioProductsExceptions("Receive timeout. Please try again.");
      case DioExceptionType.badCertificate:
        return DioProductsExceptions(
          "Bad certificate. Please check your connection.",
        );
      case DioExceptionType.connectionError:
        return DioProductsExceptions(
          "Connection error. Please check your internet.",
        );
      case DioExceptionType.cancel:
        return DioProductsExceptions("Request was cancelled.");
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return DioProductsExceptions("No Internet connection.");
        }
        return DioProductsExceptions("Unexpected product error occurred.");
      case DioExceptionType.badResponse:
        switch (statusCode) {
          case 400:
            return DioProductsExceptions(
              "Bad request. Please check filters or query.",
            );
          case 404:
            return DioProductsExceptions("Products not found.");
          case 500:
            return DioProductsExceptions("Server error. Please try again.");
          default:
            return DioProductsExceptions(
              "Product request failed. Status code: $statusCode",
            );
        }
    }
  }
}
