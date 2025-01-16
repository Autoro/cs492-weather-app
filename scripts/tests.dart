import './forecast.dart' as forecast;

Future<void> main() async {
  var cities = <List<double>> [
    // Bend, OR
    [44.05, -121.31],

    // Woodinville, WA
    [47.7543, -122.1635],

    // Redding, CA
    [40.5865, -122.3917],

    // Albuquerque, NM
    [35.0844, -106.6504],

    // Miami, FL
    [25.7617, -80.1918]
  ];

  // Create a for loop that will generate forecasts arrays for each city
  for (var latlong in cities) {
    var forecasts = await forecast.getForecastFromPoints(latlong[0], latlong[1]);
    var forecastsHourly = await forecast.getForecastHourlyFromPoints(latlong[0], latlong[1]);
  }
}