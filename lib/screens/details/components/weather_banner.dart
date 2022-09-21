import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/plant_model.dart';

class WeatherBanner extends StatelessWidget {
  final Plant plants;

  const WeatherBanner({Key? key, required this.plants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // flex: 1,
          child: Percent(
            icon: Image.asset('assets/icons/water.jpg'),
            percent: (plants.water ?? 0.0).toInt(),
          ),
        ),
        Expanded(
          // flex: 1,
          child: Row(
            children: [
              SizedBox(
                child: Image.asset('assets/icons/temp.jpg'),
              ),
              Text(plants.temperature?.toStringAsFixed(0).toString() ?? "" '°C',
                  style:
                      TextStyle(fontSize: miniTitleSize, color: Colors.black)),
            ],
          ),
        ),
        Expanded(
          // flex: 1,
          child: Percent(
            icon: Image.asset('assets/icons/humi.jpg'),
            percent: (plants.humidity ?? 0.0).toInt(),
          ),
        )
      ],
    );
  }
}

class Percent extends StatelessWidget {
  final Widget icon;
  final int? percent;

  const Percent({Key? key, required this.icon, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: icon,
        ),
        Text(
          (percent == null ? '0' : percent.toString()) + '%',
          style: TextStyle(fontSize: subTitleSize, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
