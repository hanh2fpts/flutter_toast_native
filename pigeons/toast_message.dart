import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class ToastMessage {
  void toastMessageApi(String message);
}
