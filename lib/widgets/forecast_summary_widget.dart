import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;

class ForecastSummaryWidget extends StatelessWidget {
  const ForecastSummaryWidget({
    super.key,
    required forecast.Forecast currentForecast,
  }) : _forecast = currentForecast;

  final forecast.Forecast _forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_forecast.name ?? "", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_forecast.shortForecast, style: TextStyle(fontStyle: FontStyle.italic)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${_forecast.temperature}${_forecast.temperatureUnit}"),
          )
        ],
      ),
    );
  }
}
