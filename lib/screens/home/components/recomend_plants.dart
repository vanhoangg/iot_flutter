import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../model/plant-model.dart';
import '../../details/details_screen.dart';
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
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                      child: RecomendPlantCard(
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
                      ),
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
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: kDefaultPadding / 2,
              top: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image,
                      // fit: BoxFit.cover,
                    ))),
            width: ScreenUtil.defaultSize.width * 0.5,
            height: ScreenUtil.defaultSize.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(kDefaultPadding * 0.3),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("$title".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: subTitleSize,
                                  color: kPrimaryColor)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            // flex: 1,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: kDefaultPadding / 1.5,
                                  child: Image.asset('assets/icons/water.jpg'),
                                ),
                                Text(
                                  ((plants.water ?? 0.0).toInt() == null
                                          ? '0'
                                          : (plants.water ?? 0.0)
                                              .toInt()
                                              .toString()) +
                                      '%',
                                  style: TextStyle(
                                      fontSize: miniTitleSize,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            // flex: 1,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: kDefaultPadding / 1.5,
                                  child: Image.asset('assets/icons/temp.jpg'),
                                ),
                                Text(
                                    plants.temperature
                                            .toStringAsFixed(0)
                                            .toString() +
                                        '°C',
                                    style: TextStyle(
                                        fontSize: miniTitleSize,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                          Expanded(
                            // flex: 1,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: kDefaultPadding / 1.5,
                                  child: Image.asset('assets/icons/humi.jpg'),
                                ),
                                Text(
                                  ((plants.humidity ?? 0.0).toInt() == null
                                          ? '0'
                                          : (plants.humidity ?? 0.0)
                                              .toInt()
                                              .toString()) +
                                      '%',
                                  style: TextStyle(
                                      fontSize: miniTitleSize,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
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
        ],
      ),
    );
  }
}
