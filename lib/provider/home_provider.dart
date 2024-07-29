import 'package:flutter/material.dart';
import 'package:food_api_application/controller/api_helper.dart';
import 'package:food_api_application/modal/api_modal.dart';

class HomeProvider extends ChangeNotifier
{
  int selectIndex=0;
  ApiHelper apiHelper=ApiHelper();
  late ApiModal apiModal;
  Future<ApiModal> fetchingApi()
  async {
    final list= await apiHelper.apiCalling();
    apiModal=ApiModal.fromJson(list);
    notifyListeners();
    return apiModal;
  }
  HomeProvider()
  {
    fetchingApi();
  }
  void selectingMethod(int index)
  {
    selectIndex=index;
    notifyListeners();
  }
}