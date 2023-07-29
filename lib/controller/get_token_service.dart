import 'dart:developer';

import 'package:dio/dio.dart';

class AllServices {
  Dio dio = Dio();

  Future<void> getToken() async {
    try {
      
      final uri = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword";


    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
