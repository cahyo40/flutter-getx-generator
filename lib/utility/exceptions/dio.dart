import 'dart:io';
import 'package:dio/dio.dart';

class DioExceptionHandler implements Exception {
  late String errorMessage;

  DioExceptionHandler.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Permintaan ke server dibatalkan';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Koneksi timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Timeout menerima data';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Timeout mengirim data';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          errorMessage = 'Tidak ada koneksi internet';
          break;
        }
        errorMessage = 'Terjadi kesalahan yang tidak diketahui';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Sertifikat SSL tidak valid';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Gagal terhubung ke server';
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Permintaan tidak valid';
      case 401:
        return 'Autentikasi gagal';
      case 403:
        return 'Tidak memiliki akses';
      case 404:
        return 'Data tidak ditemukan';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Terjadi kesalahan';
    }
  }

  @override
  String toString() => errorMessage;
}
