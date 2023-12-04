import 'package:ambrd_appss/model/banner_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/api_provider.dart';
import '../splash_controller/splash_controllers.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = '';
  RxBool isLoading = true.obs;
  BannerModel? getsliderbaner;
  //crusial slider banner api............

  void sliderBannerApi() async {
    isLoading(true);
    getsliderbaner = await ApiProvider.getbannerGetApi();
    if (getsliderbaner?.banner != null
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    sliderBannerApi();
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
    Get.offAllNamed(Routes.LOGIN);
  }
}
