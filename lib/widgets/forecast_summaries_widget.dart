import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/widgets/forecast_summary_widget.dart';

class ForecastSummariesWidget extends StatelessWidget {
  const ForecastSummariesWidget({
    super.key,
    required List<forecast.Forecast> forecasts,
  }) : _forecasts = forecasts;

  final List<forecast.Forecast> _forecasts;
  final int _maxForecasts = 10;

  Iterable<Widget> get forecastSummaries sync* {
    for (var currentForecast in _forecasts) {
      yield Padding(
        padding: const EdgeInsets.all(8.0),
        child: ForecastSummaryWidget(currentForecast: currentForecast),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_forecasts.isEmpty) {
      return Row(children: [Text("")]);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: forecastSummaries.take(_maxForecasts).toList()
      ),
    );
  }
}