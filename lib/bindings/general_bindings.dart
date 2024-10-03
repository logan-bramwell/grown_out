import 'package:get/get.dart';
import 'package:whs_deals_app/utils/validators/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}