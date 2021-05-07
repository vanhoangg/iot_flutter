import 'package:flutter/material.dart';
import 'package:iot_flutter/model/plant-model.dart';

class WeatherBanner extends StatelessWidget {
  final Plant plants;

  const WeatherBanner({Key key, this.plants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(plants.temperature.toStringAsFixed(0).toString() + '°C',
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Colors.black)),
          const SizedBox(
            width: 10,
          ),
          Percent(
            icon: Image.asset('assets/icons/water.jpg'),
            percent: (plants.water ?? 0.0).toInt(),
          ),
          const SizedBox(
            width: 10,
          ),
          Percent(
            icon: Image.asset('assets/icons/humi.jpg'),
            percent: (plants.humidity ?? 0.0).toInt(),
          )
        ],
      ),
    );
  }
}

class Percent extends StatelessWidget {
  final Widget icon;
  final int percent;

  const Percent({@required this.icon, @required this.percent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 17,
          child: icon,
        ),
        Text(
          (percent == null ? '0' : percent.toString()) + '%',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
