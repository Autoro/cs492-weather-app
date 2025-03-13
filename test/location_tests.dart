import "package:test/test.dart";
import "package:weatherapp/models/location.dart";

const mockCity = "Bend";
const mockState = "OR";
const mockZip = "97702";
const mockLatitude = 44.058174;
const mockLongitude = -121.315308;

Location getMockLocation() {
  return Location(
    city: mockCity,
    state: mockState,
    zip: mockZip,
    latitude: mockLatitude,
    longitude: mockLongitude,
  );
}

Map<String, dynamic> getMockLocationJson() {
  return {
    "city": mockCity,
    "state": mockState,
    "zip": mockZip,
    "latitude": mockLatitude,
    "longitude": mockLongitude
  };
}

void main() {
  test("A location is instantiated through its constructor", testLocationConstructor);
  test("A location is instantiated from a json map", testLocationFromJson);
  test("A location creates a json map", testToJson);
  test("A location can be compared to another location", testLocationEquals);
}

void testLocationConstructor() {
  var actual = getMockLocation();

  expect(actual.city, equals(mockCity));
  expect(actual.state, equals(mockState));
  expect(actual.zip, equals(mockZip));
  expect(actual.latitude, equals(mockLatitude));
  expect(actual.longitude, equals(mockLongitude));
  expect(actual.url, isNull);
}

void testLocationFromJson() {
  var jsonData = getMockLocationJson();
  var actual = Location.fromJson(jsonData);

  expect(actual.city, equals(mockCity));
  expect(actual.state, equals(mockState));
  expect(actual.zip, equals(mockZip));
  expect(actual.latitude, equals(mockLatitude));
  expect(actual.longitude, equals(mockLongitude));
  expect(actual.url, isNull);
}

void testToJson() {
  var location = getMockLocation();
  var actual = location.toJson();

  expect(actual, isMap);
  expect(actual, containsPair("city", mockCity));
  expect(actual, containsPair("state", mockState));
  expect(actual, containsPair("zip", mockZip));
  expect(actual, containsPair("latitude", mockLatitude));
  expect(actual, containsPair("longitude", mockLongitude));
  expect(actual, containsPair("url", isNull));
}

void testLocationEquals() {
  var first = getMockLocation();
  var second = getMockLocation();

  expect(first, equals(second));
}