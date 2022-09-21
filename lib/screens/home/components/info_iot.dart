import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../model/info_iot_model.dart';
import '../home_controller.dart';
import 'title_with_more_bbtn.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(isBack: true, context: context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetX<HomeController>(builder: (controller) {
          controller.getInfoIot();
          controller.getInfoIotAgri();
          controller.getInfoIotDevice();

          return Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoItem(
                  title: "Thông tin tổng quan về IOT",
                  list: controller.listInfo.value,
                ),
                InfoItem(
                  title: "Thiết bị IOT",
                  list: controller.listInfoDevice.value,
                ),
                InfoItem(
                  title: "Nông nghiệp IOT",
                  list: controller.listInfoAgri.value,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final List<InfoIot>? list;
  const InfoItem({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: TitleWithCustomUnderline(
            text: title.toUpperCase(),
          ),
        ),
        SizedBox(
          height: ScreenUtil.defaultSize.height,
          child: list?.length == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: list?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: ScreenUtil.defaultSize.height / 4,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "$baseUrl${list?[index].filePath}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: kDefaultPadding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list?[index].title ?? "",
                                    style: TextStyle(
                                        fontSize: titleSize,
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryColor),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    list?[index].content ?? "",
                                    style: TextStyle(
                                        fontSize: subTitleSize,
                                        color: kTextColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
