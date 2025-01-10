import '../../../message/exception.dart';
import '../../../message/utility.dart';
import '../../../message/validation.dart';

final Map<String, String> enUS = {
  // VALIDATION
  ValidationMessage.REQUIRED: "This @fieldName is required",
  ValidationMessage.EMAIL: "Invalid email format",
  ValidationMessage.DROPDOWN: "Please select an option",
  ValidationMessage.PHONE: "Invalid phone number format",
  ValidationMessage.PASSMIN: "Password must be at least @char characters",
  ValidationMessage.PASSNUM: "Password must contain a number",
  ValidationMessage.PASSCHAR: "Password must contain special character",
  ValidationMessage.PASSCAPITAL: "Password must contain capital letter",
  ValidationMessage.PASSCONFIRM: "Passwords do not match",
//EXCEPTION
  ExceptionMessage.CONNECTION_ERROR:
      "Failed to connect to server. Please check your internet connection and try again.",
  ExceptionMessage.CONNECTION_TIMEOUT: "Connection timeout. Please try again.",
  ExceptionMessage.NO_INTERNET:
      "No internet connection. Please check your connection.",
// DIO EXCEPTION
  DioExceptionMessages.REQUEST_CANCELLED: "Request to server was cancelled",
  DioExceptionMessages.RECEIVE_TIMEOUT: "Timeout receiving data",
  DioExceptionMessages.SEND_TIMEOUT: "Timeout sending data",
  DioExceptionMessages.UNKNOWN_ERROR: "An unknown error occurred",
  DioExceptionMessages.SSL_INVALID: "Invalid SSL certificate",

  // HTTP Status Code Messages
  DioExceptionMessages.BAD_REQUEST: "Invalid request",
  DioExceptionMessages.UNAUTHORIZED: "Authentication failed",
  DioExceptionMessages.FORBIDDEN: "Access denied",
  DioExceptionMessages.NOT_FOUND: "Data not found",
  DioExceptionMessages.SERVER_ERROR: "Internal server error",
  DioExceptionMessages.BAD_GATEWAY: "Bad gateway",
  DioExceptionMessages.DEFAULT_ERROR: "An error occurred",

  // Loading Messages
  UtilityMessage.LOADING: "Loading...",
  UtilityMessage.PROCESSING: "Processing...",
  UtilityMessage.PLEASE_WAIT: "Please wait...",
  UtilityMessage.SENDING_REQUEST: "Sending request...",

  // Auth Success Messages
  UtilityMessage.LOGIN_SUCCESS: "Login successful",
  UtilityMessage.REGISTER_SUCCESS: "Registration successful",
  UtilityMessage.LOGOUT_SUCCESS: "Logout successful",

  // CRUD Success Messages
  UtilityMessage.CREATE_SUCCESS: "Data added successfully",
  UtilityMessage.UPDATE_SUCCESS: "Data updated successfully",
  UtilityMessage.DELETE_SUCCESS: "Data deleted successfully",

  // CRUD Process Messages
  UtilityMessage.CREATING_DATA: "Adding data...",
  UtilityMessage.UPDATING_DATA: "Updating data...",
  UtilityMessage.DELETING_DATA: "Deleting data...",

  // Confirmation Messages
  UtilityMessage.DELETE_CONFIRMATION:
      "Are you sure you want to delete this data?",
  UtilityMessage.LOGOUT_CONFIRMATION: "Are you sure you want to logout?",
};
