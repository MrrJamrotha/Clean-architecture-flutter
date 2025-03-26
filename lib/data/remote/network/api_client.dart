import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:job_portal_app/core/di/injection.dart';
import 'package:job_portal_app/core/service/user_session_service.dart';
import 'package:job_portal_app/data/remote/network/api.dart'; 

class ApiClient implements Api {
  final http.Client _client;
  ApiClient(this._client);

  final _session = di.get<UserSessionService>();

  Future<Map<String, dynamic>> getParams() async {
    try {
      var auth = await _session.getUser();
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final allInfo = deviceInfo.data;
      String appId =
          Platform.isAndroid ? allInfo['id'] : allInfo['identifierForVendor'];
      String locale = "en";
      String currencyCode = "USD";
      if (auth != null) {
        locale = auth.locale;
        currencyCode = auth.currencyCode;
      }
      return {
        'code': currencyCode,
        'locale': locale,
        'application_id': appId,
      };
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Example
  // @override
  // Future<BaseResponse> getUserProfile({
  //   Map<String, dynamic>? parameters,
  // }) async {
  //   try {
  //     var params = await getParams();
  //     final mergedParams = {...?parameters, ...params};
  //     final response = await _client.post(
  //       Uri.parse(ApiEndpoints.getUserProfile),
  //       body: jsonEncode(mergedParams),
  //       headers: await ApiInterceptor.modifyHeaders(),
  //     );

  //     final body = jsonDecode(response.body);
  //     return BaseResponse(
  //       statusCode: response.statusCode,
  //       status: body['status'],
  //       message: body['message'],
  //       data: body['record'],
  //     );
  //   } catch (exception) {
  //     throw Exception(exception);
  //   }
  // }
 
}
