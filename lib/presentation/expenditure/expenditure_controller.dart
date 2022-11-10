import 'package:ebeasiswa/data/model/expenditure/expenditure_model.dart';
import 'package:get/get.dart';

import '../../data/remote/expenditure_services/expenditure_services.dart';

class ExpenditureController extends GetxController {
  var expenditureData = <ExpenditureModel>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  ExpenditureServices expenditureServices = ExpenditureServices();

  @override
  void onInit() {
    onFetchExpenditure();
    super.onInit();
  }

  Future<List<ExpenditureModel>?> onFetchExpenditure()async{
    isLoading(true);
    try{
    final data = await expenditureServices.expenditureListServices();
    expenditureData.value = data;
      isLoading(false);
      isError(false);
    } catch (e){
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
    return null;
  }
}
