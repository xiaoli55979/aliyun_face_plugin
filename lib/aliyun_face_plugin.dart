import 'aliyun_face_plugin_platform_interface.dart';

class AliyunFacePlugin {
  Future<String?> getPlatformVersion() {
    return AliyunFacePluginPlatform.instance.getPlatformVersion();
  }

  // SDK初始化接口
  Future<void> init() {
    return AliyunFacePluginPlatform.instance.init();
  }

  // SDK认证接口
  Future<String?> verify(Map<String, String> params) {
    return AliyunFacePluginPlatform.instance.verify(params);
  }

// SDK自定义UI
  Future<String?> setCustomUI(String configuration) {
    return AliyunFacePluginPlatform.instance.setCustomUI(configuration);
  }

  // 获取客户端的metainfos，用于服务器端接口获取认证id，即transactionId
  Future<String?> getMetaInfos() {
    return AliyunFacePluginPlatform.instance.getMetaInfos();
  }
}
