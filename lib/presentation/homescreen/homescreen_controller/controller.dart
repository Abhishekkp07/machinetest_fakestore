
import 'dart:developer';

import 'package:flutter/material.dart';


import '../../../respository/api/homecreen/model/homescreen_model.dart';
import '../../../respository/api/homecreen/service/homescreen_service.dart';


class HomeScreenController extends ChangeNotifier{
  Productmodel productModel= Productmodel();
  bool isLoading=false;

  fetchData()async{
    isLoading=true;
    notifyListeners();
    try{
      var data= await HomeScreenService.getData();
      if(data!= null){
        productModel=Productmodel.fromJson(data);
        isLoading=false;
      }else{
        log("failed");
      }
      notifyListeners();
    }catch(e){
      log("$e");
    }
  }

}
