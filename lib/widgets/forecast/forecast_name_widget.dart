import 'package:flutter/material.dart';
import 'package:weatherapp/models/forecast.dart' as forecast;
import 'package:weatherapp/scripts/time.dart' as time;

class ForecastNameWidget extends StatelessWidget {
  const ForecastNameWidget({
    super.key,
    required forecast.Forecast forecast,
    TextStyle? style
  }) : _forecast = forecast, _style = style;

  final forecast.Forecast _forecast;
  final TextStyle? _style;

  @override
  Widget build(BuildContext context) {
    return Text(
      _forecast.name ?? time.convertTimestampToDayAndHour(_forecast.startTime.toLocal()),
      textAlign: TextAlign.center,
      style: _style
    );
  }
}
