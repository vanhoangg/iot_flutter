import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/model/plant-model.dart';
import 'package:iot_flutter/screens/details/components/weather_banner.dart';
import 'package:iot_flutter/screens/details/details_screen.dart';

import '../../../constants.dart';
import '../home_controller.dart';

class RecomendsPlants extends StatelessWidget {
  final HomeController controller = Get.find();
  RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getListPlant();
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Obx(() => controller.listPlants?.value?.length == null
              ? SizedBox.shrink()
              : Row(
                  children: List.generate(controller.listPlants.value?.length,
                      (index) {
                    return RecomendPlantCard(
                      plants: controller.listPlants.value[index],
                      image:
                          "$baseUrl${controller.listPlants.value[index].filePath}",
                      title: controller.listPlants.value[index].title,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                plants: controller.listPlants?.value[index]),
                          ),
                        );
                      },
                    );
                  }),
                )),
        ));
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.plants,
    this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;
  final Plant plants;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Container(
        // color: Colors.blue,
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding,
          bottom: kDefaultPadding,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  image,
                  // fit: BoxFit.cover,
                ))),
        width: size.width * 0.4,
        height: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Spacer(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding * 0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text("$title".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                      ),
                      Expanded(
                        child: Text(
                            plants.temperature.toStringAsFixed(0).toString() +
                                '°C',
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Percent(
                          icon: Image.asset('assets/icons/water.jpg'),
                          percent: (plants.water ?? 0.0).toInt(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Percent(
                          icon: Image.asset('assets/icons/humi.jpg'),
                          percent: (plants.humidity ?? 0.0).toInt(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
