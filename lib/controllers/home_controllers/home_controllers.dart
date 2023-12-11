import 'package:ambrd_appss/model/all_services_model.dart';
import 'package:ambrd_appss/model/banner_model.dart';
import 'package:ambrd_appss/model/service_dertail_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/api_provider.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = '';
  RxBool isLoading = true.obs;
  BannerModel? getsliderbaner;
  AllServicesUser? allServicesUser;
  ServiceDetailModel? serviceDetailModel;

  ///crusial slider banner api..............................................

  Future<void> sliderBannerApi() async {
    isLoading(true);
    getsliderbaner = await ApiProvider.getbannerGetApi();
    if (getsliderbaner?.banner != null
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    } else {}
  }

  ///todo: all services.....................
  Future<void> AllServicesApi() async {
    isLoading(true);
    allServicesUser = await ApiProvider.allServicesApi();
    if (allServicesUser != null) {
      isLoading(false);
    } else {}
  }

  ///todo: all services detail.....................
  Future<void> AllServicesDetailApi() async {
    isLoading(true);
    serviceDetailModel = await ApiProvider.detailServicesbApi();
    if (serviceDetailModel != null) {
      isLoading(false);
    } else {}
  }

  //detailServicesbApi

  @override
  void onInit() {
    super.onInit();
    sliderBannerApi();
    AllServicesApi();
    AllServicesDetailApi();
    // auto login
    //name = getStorage.read("name");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   //TODO: implement oninit
  //   super.onClose();
  // }
  logout() {
    getStorage.erase();
    // Get.offAllNamed(Routes.LOGIN);
  }
}
