import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/components/loading_page.dart';
import 'package:iot_flutter/constants.dart';
import 'package:iot_flutter/screens/history/history_controller.dart';

class TabHistorty extends StatefulWidget {
  @override
  _TabHistortyState createState() => _TabHistortyState();
}

class _TabHistortyState extends State<TabHistorty>
    with AutomaticKeepAliveClientMixin<TabHistorty> {
  final HistoryController controller = Get.find();

  @override
  void initState() {
    controller.getHistory();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.separated(
        separatorBuilder: (_, index) => SizedBox(
              height: 10,
              child: ColoredBox(
                color: kTextColor,
              ),
            ),
        itemCount: 7,
        itemBuilder: (_, index) {
          return Obx(() => controller.listHistory.value?.length == null
              ? AppLoading(child: SizedBox(), loading: false)
              : GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Container(
                    color: controller.listHistory?.value[index].isStart
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
                                    controller.listHistory?.value[index]?.user,
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
                                    controller.listHistory?.value[index]?.topic,
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
                                    controller.listHistory?.value[index].isStart
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
                            "${controller.setImageForSensor(controller.listHistory?.value[index].topic)}",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
        });
  }

  @override
  bool get wantKeepAlive => true;
}
