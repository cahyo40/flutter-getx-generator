import 'dart:io';
import '../constants/message/exception.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioExceptionHandler implements Exception {
  late String errorMessage;

  DioExceptionHandler.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage = DioExceptionMessages.REQUEST_CANCELLED.tr;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = ExceptionMessage.CONNECTION_TIMEOUT.tr;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = DioExceptionMessages.RECEIVE_TIMEOUT.tr;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = DioExceptionMessages.SEND_TIMEOUT.tr;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          errorMessage = ExceptionMessage.CONNECTION_ERROR.tr;
          break;
        }
        errorMessage = DioExceptionMessages.UNKNOWN_ERROR.tr;
        break;
      case DioExceptionType.badCertificate:
        errorMessage = DioExceptionMessages.SSL_INVALID.tr;
        break;
      case DioExceptionType.connectionError:
        errorMessage = ExceptionMessage.CONNECTION_ERROR.tr;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return DioExceptionMessages.BAD_REQUEST.tr;
      case 401:
        return DioExceptionMessages.UNAUTHORIZED.tr;
      case 403:
        return DioExceptionMessages.FORBIDDEN.tr;
      case 404:
        return DioExceptionMessages.NOT_FOUND.tr;
      case 500:
        return DioExceptionMessages.SERVER_ERROR.tr;
      case 502:
        return DioExceptionMessages.BAD_GATEWAY.tr;
      default:
        return DioExceptionMessages.DEFAULT_ERROR.tr;
    }
  }

  @override
  String toString() => errorMessage;
}
