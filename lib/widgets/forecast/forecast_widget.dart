import 'package:flutter/material.dart';
import 'package:weatherapp/models/forecast.dart' as forecast;
import 'package:weatherapp/scripts/math.dart' as math;
import 'package:weatherapp/widgets/forecast/detailed_forecast_widget.dart';
import 'package:weatherapp/widgets/forecast/forecast_name_widget.dart';
import 'package:weatherapp/widgets/weather_icon_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
    required forecast.Forecast forecast,
  }) : _forecast = forecast;

  final forecast.Forecast _forecast;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ForecastNameWidget(forecast: _forecast, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            WeatherIconWidget(iconPath: _forecast.getIconPath(), height: 100, width: 100),
            Text(_forecast.shortForecast),
            Text("Wind: ${_forecast.windSpeed} ${_forecast.windDirection}"),
            Text("Temp: ${_forecast.temperature}°${_forecast.temperatureUnit}"),
            Text(_forecast.dewpoint != null ? "Dewpoint: ${math.roundToDecimalPlaces(_forecast.dewpoint, 2)}" : ""),
            Text(_forecast.humidity != null ? "Humidity: ${_forecast.humidity}" : ""),
            Text(_forecast.precipitationProbability != null
              ? "Chance of Rain: ${_forecast.precipitationProbability}"
              : ""
            ),
            DetailedForecastWidget(forecast: _forecast)
          ],
        ),
      ),
    );
  }
}
