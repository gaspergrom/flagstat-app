import 'dart:io';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  getDeviceInfo() async{
    var package =  await PackageInfo.fromPlatform();
    if(GetPlatform.isIOS){
      IosDeviceInfo data = await deviceInfo.iosInfo;
      return {
        'about': {
          'model': data.model,
          'type': data.name,
          'vendor': data.identifierForVendor
        },
        'platform': Platform.operatingSystem,
        'systemLanguage': Platform.localeName,
        'os': {
          'name': data.systemName,
          'version': data.systemVersion
        },
        'identifiers': {
          'device': data.name,
          'vendor': data.identifierForVendor
        },
        'product': {
          'build': package.buildNumber,
          'identifier': 'app.flagstat.app.flagstat',
          'version': package.version
        }
      };
    }
    else {
      AndroidDeviceInfo data = await deviceInfo.androidInfo;
      return {
        'about': {
          'model': '',
          'type': '',
          'vendor': ''
        },
        'platform': Platform.operatingSystem,
        'systemLanguage': Platform.localeName,
        'os': {
          'name': '',
          'version': ''
        },
        'identifiers': {
          'device': '',
          'vendor': ''
        },
        'product': {
          'build': package.buildNumber,
          'identifier': 'app.flagstat.app.flagstat',
          'version': package.version
        }
      };
    }
  }
}

final deviceService = DeviceService();