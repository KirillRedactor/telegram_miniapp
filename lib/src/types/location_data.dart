// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_manager.dart';

@JSExport()
class LocationData {
  double latitude;
  double longitude;
  double? altitude;
  double? course;
  double? speed;
  double? horizontalAccuracy;
  double? verticalAccuracy;
  double? courseAccuracy;
  double? speedAccuracy;

  LocationData._({
    required this.latitude,
    required this.longitude,
    this.altitude,
    this.course,
    this.speed,
    this.horizontalAccuracy,
    this.verticalAccuracy,
    this.courseAccuracy,
    this.speedAccuracy,
  });

  // ignore: library_private_types_in_public_api
  factory LocationData.fromExternal(_LocationDataExternal ext) =>
      LocationData._(
        latitude: ext.latitude,
        longitude: ext.longitude,
        altitude: ext.altitude,
        course: ext.course,
        speed: ext.speed,
        horizontalAccuracy: ext.horizontal_accuracy,
        verticalAccuracy: ext.vertical_accuracy,
        courseAccuracy: ext.course_accuracy,
        speedAccuracy: ext.speed_accuracy,
      );

  // LocationDataExternal get _toExt =>
  //     createJSInteropWrapper<LocationData>(this) as LocationDataExternal;
}

extension type _LocationDataExternal(JSObject _) implements JSObject {
  external double latitude;
  external double longitude;
  external double? altitude;
  external double? course;
  external double? speed;
  // ignore: non_constant_identifier_names
  external double? horizontal_accuracy;
  // ignore: non_constant_identifier_names
  external double? vertical_accuracy;
  // ignore: non_constant_identifier_names
  external double? course_accuracy;
  // ignore: non_constant_identifier_names
  external double? speed_accuracy;
}
