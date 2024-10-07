import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nivaas/core/config/env.dart';
import 'package:nivaas/core/const/api_const.dart';
import 'package:nivaas/utils/storage_utils/secure_storage.dart';

import '../network/network_check_service.dart';

enum Method { post, get, put, delete, patch }

class DioClient with NetworkCheckService {
  late Dio dio;
  late Dio storeDio;

  Future<Map<String, String>> _getHeaders() async {
    String? token = await SecureStorage().readData(key: TOKEN);
    return {
      'Content-Type': 'application/json',
      "accept": "application/json",
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, String>> _getStoreHeaders() async {
    String? token = await SecureStorage().readData(key: TOKEN);
    return {
      'Content-Type': 'application/json',
      "accept": "application/json",
      'Authorization': 'Bearer $token',
    };
  }

  Future<DioClient> init() async {
    dio =
        Dio(BaseOptions(baseUrl: Env().baseURL, headers: await _getHeaders()));
    storeDio = Dio(BaseOptions(
        baseUrl: Env().storeBaseUrl, headers: await _getStoreHeaders()));

    initInterceptors();
    return this;
  }

  void initInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      log('REQUEST[${options.method}] => PATH: ${options.path} '
          '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      log('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('$ERROR[${err.response?.data}]');
      if (err.response!.statusCode == 400) {
        print(
            'RESPONSE[${err.response!.statusCode}] => DATA: ${err.response!.data['message']}');
      }
      return handler.next(err);
    }));

    storeDio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      log('REQUEST[${options.method}] => PATH: ${options.path} '
          '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      log('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('$ERROR[${err.response?.data}]');
      if (err.response!.statusCode == 400) {
        print(
            'RESPONSE[${err.response!.statusCode}] => DATA: ${err.response!.data['message']}');
      }
      return handler.next(err);
    }));
  }

  Future<Either<Response, Exception>> request(String url, Method method,
      {params}) async {
    Response response;
    debugPrint('>>>>>>$url>>>>>>>>>>>$params');
    try {
      if (method == Method.post) {
        response = await dio.post(url, data: params);
      } else if (method == Method.put) {
        response = await dio.put(url, data: params);
      } else if (method == Method.delete) {
        response = await dio.delete(url);
      } else if (method == Method.patch) {
        response = await dio.patch(url, queryParameters: params);
      } else {
        response = await dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 202) {
        return Left(response);
      } else if (response.statusCode == 401) {
        throw Right(Exception("Unauthorized"));
      } else if (response.statusCode == 500) {
        throw Right(Exception("Server Error"));
      } else {
        throw Right(Exception("Something Went Wrong"));
      }
    } on SocketException {
      throw Right(Exception("No Internet Connection"));
    } on FormatException {
      throw Right(Exception("Bad Response Format!"));
    } on DioException catch (e) {
      throw Right(Exception(e));
    } catch (e) {
      throw Right(Exception("Something Went Wrong"));
    }
  }

  Future<Either<Response, Exception>> storeRequest(String url, Method method,
      {params}) async {
    Response response;
    print('url=============>>$url');
    try {
      if (method == Method.post) {
        response = await storeDio.post(url, data: params);
      } else if (method == Method.put) {
        response = await storeDio.put(url, data: params);
      } else if (method == Method.delete) {
        response = await storeDio.delete(url);
      } else if (method == Method.patch) {
        response = await storeDio.patch(url, queryParameters: params);
      } else {
        response = await storeDio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 202) {
        return Left(response);
      } else if (response.statusCode == 401) {
        throw Right(Exception("Unauthorized"));
      } else if (response.statusCode == 500) {
        throw Right(Exception("Server Error"));
      } else {
        throw Right(Exception("Something Went Wrong"));
      }
    } on SocketException {
      throw Right(Exception("No Internet Connection"));
    } on FormatException {
      throw Right(Exception("Bad Response Format!"));
    } on DioException catch (e) {
      throw Right(Exception(e));
    } catch (e) {
      throw Right(Exception("Something Went Wrong"));
    }
  }
}