import 'dart:io';

Future<bool> checkInternetConnection() async {
  try {
    await InternetAddress.lookup('google.com');
    //Nothing to do --> continue in code
  } on SocketException catch (_) {
    return false;
  }
  return true;
}
