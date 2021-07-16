import 'package:get/get.dart';

import '../../constants.dart';
import '../../model/info-iot_model.dart';
import '../../model/plant-model.dart';
import '../../repository/info-iot.repo.dart';
import '../../repository/plant.repo.dart';

class HomeController extends GetxController {
  final InfoIotRepository infoIotRepository = InfoIotRepository();
  final PlantRepository plantRepository = PlantRepository();
  var listInfo = Rx<List<InfoIot>>();
  var listPlants = Rx<List<Plant>>();
  var listInfoDevice = Rx<List<InfoIot>>();
  var listInfoAgri = Rx<List<InfoIot>>();

  @override
  void onInit() {
    getInfoIot();
    getInfoIotDevice();
    getInfoIotAgri();
    getListPlant();
    super.onInit();
  }

  getInfoIot() async {
    String url = "$baseUrl$infoIots";
    await infoIotRepository.fetchBanners(url: url).then((value) {
      listInfo.value = value;
      update();
    });
  }

  getInfoIotDevice() async {
    String url = "$baseUrl$infoIotDevice";
    await infoIotRepository.fetchBanners(url: url).then((value) {
      listInfoDevice.value = value;
      update();
    });
  }

  getInfoIotAgri() async {
    String url = "$baseUrl$infoIotAgriculture";
    await infoIotRepository.fetchBanners(url: url).then((value) {
      listInfoAgri.value = value;
      update();
    });
  }

  getListPlant() async {
    await plantRepository.getPlant().then((value) {
      listPlants.value = value;
    });
    update();
  }
}
