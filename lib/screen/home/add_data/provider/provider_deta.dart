import 'package:flutter/cupertino.dart';

import '../../../../utils/api_helper.dart';
import '../model/model_class.dart';


class ProductProvider extends ChangeNotifier
{
  List<EcommerceModal> jsonData=[];
  Future<void> getApi() async{
    ApiHelper api = ApiHelper();
    jsonData = await api.getApi();
    notifyListeners();
  }
}