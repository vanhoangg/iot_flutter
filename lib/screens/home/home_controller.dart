import 'package:get/get.dart';
import 'package:iot_flutter/model/info-iot_model.dart';
import 'package:iot_flutter/model/plant-model.dart';
import 'package:iot_flutter/repository/info-iot.repo.dart';
import 'package:iot_flutter/repository/plant.repo.dart';

class HomeController extends GetxController {
  final InfoIotRepository infoIotRepository = InfoIotRepository();
  final PlantRepository plantRepository = PlantRepository();

  @override
  void onInit() {
    getInfoIot();
    getListPlant();
    super.onInit();
  }

  var listInfo = Rx<List<InfoIot>>();
  var listPlants = Rx<List<Plant>>();
  getInfoIot() async {
    await infoIotRepository.fetchBanners().then((value) {
      listInfo?.value = value;
      update();
    });
  }

  getListPlant() async {
    await plantRepository.getPlant().then((value) {
      listPlants?.value = value;
      update();
    });
  }
}
