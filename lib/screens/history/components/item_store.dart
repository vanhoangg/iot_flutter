import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../iot_dashboard/dashboard.dart';
import '../history_controller.dart';

class ItemStore extends StatefulWidget {
  @override
  _ItemStoreState createState() => _ItemStoreState();
}

class _ItemStoreState extends State<ItemStore>
    with AutomaticKeepAliveClientMixin<ItemStore> {
  HistoryController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return controller.listTopic.value?.length == null
        ? loadding
        : ListView.separated(
            separatorBuilder: (_, index) => SizedBox(
                  height: 5,
                  child: ColoredBox(
                    color: kTextColor,
                  ),
                ),
            itemCount: controller.listTopic.value?.length,
            itemBuilder: (_, index) {
              return GetBuilder<HistoryController>(builder: (controller) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    DashBoardScreen.go(
                      history: controller.listTopic?.value[index],
                    );
                  },
                  child: Container(
                    color: controller.listTopic?.value[index].isStart
                        ? kPrimaryColor.withOpacity(0.1)
                        : Colors.grey[400],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    "Người dùng : ",
                                  ),
                                  Text(
                                    controller.listTopic?.value[index]?.user,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    "Tên Sensor : ",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    controller
                                        .listTopic?.value[index]?.sensorName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Trạng thái : ",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    controller.listTopic?.value[index].isStart
                                        ? "Bật"
                                        : "Tắt",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 80,
                          child: Image.asset(
                            "${controller.setImageForSensorHistory(controller.listTopic?.value[index])}",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            });
  }

  @override
  bool get wantKeepAlive => true;
}
