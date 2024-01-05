import 'package:package_info_plus/package_info_plus.dart';

class PlatformInfo {
  static late final PackageInfo prefsInstance;

  static Future<PackageInfo> init() async =>
      prefsInstance = await PackageInfo.fromPlatform();
}
