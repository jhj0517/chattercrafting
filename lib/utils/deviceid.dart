import 'package:flutter_udid/flutter_udid.dart';

// This does not remain same value after re-installing app
class DeviceManager{
  static Future<String> getDeviceId() async {
    String deviceId;
    deviceId = await FlutterUdid.consistentUdid;
    return deviceId;
  }
}
