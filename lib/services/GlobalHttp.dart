import 'dart:convert';
import 'dart:io';

import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/utils/SharedPrafrance/SharedPrafranceManager.dart';
import '../utils/SharedPrafrance/SharedPrafranceKeys.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/AccountModel.dart';
import '../screens/AccountScreens/login_screen.dart';
import '../utils/GlobalData.dart';
import '../utils/GoTo.dart';
import '../utils/ToastM.dart';

class GlobalHttpResponse {
  int? statusCode;
  String? body;
  GlobalHttpResponse({this.statusCode, this.body});
}

// General Http API
class GlobalHttp {
  static Future<GlobalHttpResponse> post(
    url, {
    body,
    contentTypeHeader,
    authorizationHeader,
    String? cid,
  }) async {
    var dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
      HttpClient client,
    ) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
      return client;
    };
    Response? response;
    try {
      if (cid == null) {
        String s = await SharedPrafranceManager().getData(
          SecureStorageKeys.accountData,
        );
        cid = AccountModel.fromJson(json.decode(s)).objectData.clinicName!;
      }

      response = await dio.post<String>(
        url,
        data: body,
        options: Options(
          headers: {
            if (authorizationHeader != null)
              "Authorization": authorizationHeader,
            "cid": cid,
          },
          receiveDataWhenStatusError: false,
          validateStatus: (stats) {
            print(stats);
            return true;
          },
          contentType: contentTypeHeader,
        ),
      );
    } catch (e) {
      print(e.toString());
    }

    // GoTo.screenAndRemoveUntil(GlobalData.globalContext, LoginScreen());
    if (response!.statusCode == 401) {
      await SharedPrafranceManager().deleteAllDataStorage();
      GoTo.screenAndRemoveUntil(GlobalData.globalContext!, LoginScreen());
    }
    if (response.statusCode == 400) {
      try {
        print("DDDD");
        ToastM.show(response.data);
      } catch (e) {
        print("FFFFFFF");
        ToastM.show(S().SomeThingWentWrongs);
      }
    }

    print("Response Of Post :: " + response.data);

    return GlobalHttpResponse(
      statusCode: response.statusCode,
      body: response.data,
    );
  }

  static Future<GlobalHttpResponse> get(
    url, {
    contentTypeHeader,
    authorizationHeader,
  }) async {
    var dio = Dio();
    Response? response;
    try {
      // Response response;

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
        HttpClient client,
      ) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => false;
        return client;
      };

      response = await dio.get<String>(
        Uri.encodeFull(url),
        options: Options(
          headers:
              (authorizationHeader != null)
                  ? {"Authorization": authorizationHeader}
                  : null,
          receiveDataWhenStatusError: false,
          validateStatus: (stats) {
            print(stats);
            return true;
          },
        ),
      );
    } catch (e) {}

    // GoTo.screenAndRemoveUntil(GlobalData.globalContext, LoginScreen());
    if (response!.statusCode == 401) {
      await SharedPrafranceManager().deleteAllDataStorage();
      GoTo.screenAndRemoveUntil(GlobalData.globalContext!, LoginScreen());
    }
    if (response.statusCode == 400) {
      try {
        print("DDDD");
        ToastM.show(json.decode(response.data)['message'].toString());
      } catch (e) {
        print("FFFFFFF");
        ToastM.show(S().SomeThingWentWrongs);
      }
    }
    print("Response Of Get :: " + response.data);

    return GlobalHttpResponse(
      statusCode: response.statusCode,
      body: response.data,
    );
  }

  static Future<GlobalHttpResponse> delete(
    url, {
    body,
    contentTypeHeader,
    authorizationHeader,
  }) async {
    var dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
      HttpClient client,
    ) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
      return client;
    };
    Response? response;
    try {
      response = await dio.delete<String>(
        url,
        data: body,
        options: Options(
          headers:
              (authorizationHeader != null)
                  ? {"Authorization": authorizationHeader}
                  : null,
          receiveDataWhenStatusError: false,
          validateStatus: (stats) {
            print(stats);
            return true;
          },
          contentType: contentTypeHeader,
        ),
      );
    } catch (e) {}

    // GoTo.screenAndRemoveUntil(GlobalData.globalContext, LoginScreen());
    if (response!.statusCode == 401) {
      await SharedPrafranceManager().deleteAllDataStorage();
      GoTo.screenAndRemoveUntil(GlobalData.globalContext!, LoginScreen());
    }
    if (response.statusCode == 400) {
      try {
        print("DDDD");
        ToastM.show(json.decode(response.data)['message'].toString());
      } catch (e) {
        print("FFFFFFF");
        ToastM.show(S().SomeThingWentWrongs);
      }
    }

    print("Response Of Delete :: " + response.data);

    return GlobalHttpResponse(
      statusCode: response.statusCode,
      body: response.data,
    );
  }

  static Future<GlobalHttpResponse> uploadFiles(
    url, {
    required FormData body,
    contentTypeHeader,
    authorizationHeader,
  }) async {
    // String boundary = "---8d0f01e6b3b5dafaaadaad";
    var dio = Dio();

    Response? response;
    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
        HttpClient client,
      ) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => false;
        return client;
      };

      response = await dio.post(
        url,
        data: body,
        options: Options(
          headers:
              (authorizationHeader != null)
                  ? {"Authorization": authorizationHeader}
                  : null,
          receiveDataWhenStatusError: false,
          validateStatus: (stats) {
            print(stats);
            return true;
          },
          contentType: contentTypeHeader,
        ),
      );
    } catch (e, s) {}
    // print("RRR:::F" +
    //     response.statusCode.toString() +
    //     "---" +
    //     EncryptionHandler.decrypt(response.data));
    return GlobalHttpResponse(
      statusCode: response!.statusCode,
      body: response.data,
    );
  }
}
