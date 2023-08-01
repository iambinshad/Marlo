import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';
import 'package:marlo_technologies/model/get_token_model.dart';
import 'package:marlo_technologies/model/transaction_list_model.dart';
import 'package:provider/provider.dart';

class AllServices {
  Dio dio = Dio();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> getToken() async {
    try {
      const uri =
          "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword";
      GetTokenModel dataModel = GetTokenModel(
          email: "marloneobankdemo@gmail.com",
          password: "Marlo@123",
          returnSecureToken: true);
      Response response = await dio.post(uri,
          data: jsonEncode(dataModel.toJson()),
          queryParameters: {'key': 'AIzaSyBFiEDfEaaK6lBtIdxLXspmxGux1TGsCmg'});

      final token = response.data['idToken'];
      log(token);
      await storage.write(key: 'access_token', value: token);
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }

  Future<List<AllTransactionModel>?> allTransactionService(
      BuildContext context) async {
    try {
      final tokens = await storage.read(key: 'access_token');
      String? tokenData = tokens!.replaceAll('"', '');

      const uri =
          "https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/v2/airwallex/780e055c-35af-4d3b-ac82-49dff490ed91/transfers";
      Response response = await dio.get(
        uri,
        options: Options(headers: {"authtoken": tokenData}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        List<AllTransactionModel> transactions =
            data.map((item) => AllTransactionModel.fromJson(item)).toList();
        return transactions;
      }
    } on DioException catch (e) {
      log(e.message.toString(), name: 'something');
      if (e.message.toString() ==
          'The request returned an invalid status code of 401.') {
        Provider.of<FilterProvider>(context, listen: false)
            .regenerateToken(context);
      }
    }
    return null;
  }
}
