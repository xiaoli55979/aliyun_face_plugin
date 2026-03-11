import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aliyun_face_plugin_platform_interface.dart';

/// An implementation of [AliyunFacePluginPlatform] that uses method channels.
class MethodChannelAliyunFacePlugin extends AliyunFacePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('aliyun_face_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> init() async {
    await methodChannel.invokeMethod<String>('init');
  }

  @override
  Future<String?> getMetaInfos() async {
    final facetMetaInfo =
        await methodChannel.invokeMethod<String>('getMetaInfos');
    return facetMetaInfo;
  }

  @override
  Future<String?> verify(Map<String, String> params) async {
    final code = await methodChannel.invokeMethod<String>('verify', params);
    return code;
  }

  @override
  Future<String?> setCustomUI(String configuration) async {
    final customUI = await methodChannel.invokeMethod<String>('setCustomUI', configuration);
    return customUI;
  }
}
