import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marlo_technologies/model/get_token_model.dart';

class AllServices {
  Dio dio = Dio();

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
      log(response.toString());
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
