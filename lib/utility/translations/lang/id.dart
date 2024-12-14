import '../../constants/message/exception.dart';
import '../../constants/message/utility.dart';
import '../../constants/message/validation.dart';

final Map<String, String> idID = {
  // Validation
  ValidationMessage.REQUIRED: "@fieldName wajib diisi",
  ValidationMessage.EMAIL: "Format email tidak valid",
  ValidationMessage.DROPDOWN: "Silakan pilih salah satu opsi",
  ValidationMessage.PHONE: "Format nomor telepon tidak valid",
  ValidationMessage.PASSMIN: "Password minimal @char karakter",
  ValidationMessage.PASSNUM: "Password harus mengandung angka",
  ValidationMessage.PASSCHAR: "Password harus mengandung karakter khusus",
  ValidationMessage.PASSCAPITAL: "Password harus mengandung huruf kapital",
  ValidationMessage.PASSCONFIRM: "Password tidak cocok",

  //Exception
  ExceptionMessage.CONNECTION_ERROR:
      "Gagal terhubung ke server. Periksa koneksi internet Anda dan coba lagi.",
  ExceptionMessage.CONNECTION_TIMEOUT: "Koneksi timeout. Silakan coba lagi.",
  ExceptionMessage.NO_INTERNET:
      "Tidak ada koneksi internet. Mohon periksa koneksi Anda.",

  // Dio Exception Messages
  DioExceptionMessages.REQUEST_CANCELLED: "Permintaan ke server dibatalkan",
  DioExceptionMessages.RECEIVE_TIMEOUT: "Timeout menerima data",
  DioExceptionMessages.SEND_TIMEOUT: "Timeout mengirim data",
  DioExceptionMessages.UNKNOWN_ERROR: "Terjadi kesalahan yang tidak diketahui",
  DioExceptionMessages.BAD_REQUEST: "Permintaan tidak valid",

  DioExceptionMessages.UNAUTHORIZED: "Autentikasi gagal",
  DioExceptionMessages.FORBIDDEN: "Tidak memiliki akses",
  DioExceptionMessages.NOT_FOUND: "Data tidak ditemukan",
  DioExceptionMessages.SERVER_ERROR: "Internal server error",
  DioExceptionMessages.BAD_GATEWAY: "Bad gateway",
  DioExceptionMessages.DEFAULT_ERROR: "Terjadi kesalahan",

  // Loading Messages
  UtilityMessage.LOADING: "Sedang memuat...",
  UtilityMessage.PROCESSING: "Sedang memproses...",
  UtilityMessage.PLEASE_WAIT: "Mohon tunggu...",
  UtilityMessage.SENDING_REQUEST: "Mengirim permintaan...",

  // Auth Success Messages
  UtilityMessage.LOGIN_SUCCESS: "Berhasil masuk",
  UtilityMessage.REGISTER_SUCCESS: "Pendaftaran berhasil",
  UtilityMessage.LOGOUT_SUCCESS: "Berhasil keluar",

  // CRUD Success Messages
  UtilityMessage.CREATE_SUCCESS: "Data berhasil ditambahkan",
  UtilityMessage.UPDATE_SUCCESS: "Data berhasil diperbarui",
  UtilityMessage.DELETE_SUCCESS: "Data berhasil dihapus",

  // CRUD Process Messages
  UtilityMessage.CREATING_DATA: "Sedang menambahkan data...",
  UtilityMessage.UPDATING_DATA: "Sedang memperbarui data...",
  UtilityMessage.DELETING_DATA: "Sedang menghapus data...",

  // Confirmation Messages
  UtilityMessage.DELETE_CONFIRMATION:
      "Apakah Anda yakin ingin menghapus data ini?",
  UtilityMessage.LOGOUT_CONFIRMATION: "Apakah Anda yakin ingin keluar?",
};
