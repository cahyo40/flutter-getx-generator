import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../utility/constants/message/exception.dart';
import '../widgets/snackbar.dart';

class NetworkController extends GetxController {
  RxBool isConnected = false.obs;
  RxBool isCheckingConnection = false.obs;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  Future<bool> checkConnection() async {
    if (isCheckingConnection.value) return isConnected.value;

    isCheckingConnection.value = true;
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult[0] == ConnectivityResult.none) {
        AppSnackbar(
          message: ExceptionMessage.NO_INTERNET.tr,
          messageType: SnackbarMessageType.ERROR,
        ).show();
        isConnected.value = false;
        return false;
      }
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));

      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      return isConnected.value;
    } catch (e) {
      if (e is SocketException) {
        AppSnackbar(
          message: ExceptionMessage.CONNECTION_ERROR.tr,
          messageType: SnackbarMessageType.ERROR,
        ).show();
      } else if (e is TimeoutException) {
        AppSnackbar(
          message: ExceptionMessage.CONNECTION_TIMEOUT.tr,
          messageType: SnackbarMessageType.ERROR,
        ).show();
      } else {
        AppSnackbar(
          message: ExceptionMessage.CONNECTION_ERROR.tr,
          messageType: SnackbarMessageType.ERROR,
        ).show();
      }
      isConnected.value = false;
      return false;
    } finally {
      isCheckingConnection.value = false;
    }
  }

  void _setupConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      await Future.delayed(const Duration(milliseconds: 500));
      await checkConnection();
    });
  }

  @override
  void onInit() {
    checkConnection();
    _setupConnectivityListener();
    super.onInit();
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }
}
