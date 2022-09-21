import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/sub_sensor.model.dart';

class DetailSensor extends StatefulWidget {
  final SubSensorModel? sono;
  final SubSensorModel? thermo;
  const DetailSensor({Key? key, this.sono, this.thermo}) : super(key: key);
  @override
  _DetailSensorState createState() => _DetailSensorState();
}

class _DetailSensorState extends State<DetailSensor> {
  @override
  Widget build(BuildContext context) {
    if (widget.sono == null || widget.thermo == null) return loadding;

    return Column(
      children: const [
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

// class _Card extends StatelessWidget {
//   final bool select;
//   final void Function() onTap;
//   final int ts;
//   final String iconCode;

//   final DateTime _dateTime;
//   _Card({this.select = false, this.onTap, this.ts, this.iconCode})
//       : _dateTime =
//             ts == null ? null : DateTime.fromMillisecondsSinceEpoch(ts * 1000);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (onTap != null) onTap();
//       },
//       child: SizedBox(
//         width: 60,
//         child: Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//                 color: select ? AppColor.primary : null,
//                 border: Border.all(color: AppColor.primary, width: 1),
//                 borderRadius: const BorderRadius.all(Radius.circular(8))),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   _dateTime == null ? '' : _dateTime.day.toString(),
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: select ? Colors.white : null),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   _dateTime == null ? '' : DateFormat('EEE').format(_dateTime),
//                   style: TextStyle(color: select ? Colors.white : null),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Expanded(
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints.expand(),
//                     child: DecoratedBox(
//                       decoration: const BoxDecoration(
//                           color: AppColor.primary,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(8),
//                               bottomRight: Radius.circular(8))),
//                       child: iconCode == null
//                           ? const SizedBox.shrink()
//                           : Image.network(
//                               'https://openweathermap.org/img/wn/$iconCode@4x.png',
//                             ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class AttributeWidget extends StatelessWidget {
  final String title;
  final String content;
  final String assetName;
  final Color color;

  const AttributeWidget(
      {Key? key,
      required this.title,
      required this.color,
      required this.content,
      required this.assetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(
                9,
              ),
              child: Image.asset(assetName),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: subTitleSize),
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: subTitleSize,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }
}
