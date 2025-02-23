import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart 'as http;

import '../../app_config/app_config.dart';
class ApiHelper{
  static getData({
    required String endPoint,
    Map<String,String>? header,
  })async{
    log("ApiHelper>getData");
    final url= Uri.parse(AppConfig.baseurl + endPoint);
    log("final url -> $url");
    try{
      var response= await http.get(url ,headers:header);
      log(" Api Called status code =${ response.statusCode}");
      if(response.statusCode==200){
        var decodedData =jsonDecode(response.body);
        log(decodedData.toString());
        var data={
          "data":decodedData,
          "status":1,
        };
        return data;
      }else{
        log("Else Condition  Api failed");
        var data ={
          "data":null,
          "status":0,
        };
        return data;
      }
    }catch(e){
      log("$e");
    }
  }
}