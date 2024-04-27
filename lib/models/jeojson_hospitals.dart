import 'dart:convert';

class GeoJsonFeature {
  final String? name;
  final String? nameEn;
  final String? amenity;
  final String? healthcare;
  final String? healthcareSpeciality;
  final String? addrFull;
  final String? addrCity;
  final String? nameAr;
  final int? osmId;
  final String? osmType;
  final List<List<List<double>>> coordinates;

  GeoJsonFeature({
    this.name,
    this.nameEn,
    this.amenity,
    this.healthcare,
    this.healthcareSpeciality,
    this.addrFull,
    this.addrCity,
    this.nameAr,
    this.osmId,
    this.osmType,
    required this.coordinates,
  });

  factory GeoJsonFeature.fromJson(Map<String, dynamic> json) {
    return GeoJsonFeature(
      name: json['properties']['name'],
      nameEn: json['properties']['name:en'],
      amenity: json['properties']['amenity'],
      healthcare: json['properties']['healthcare'],
      healthcareSpeciality: json['properties']['healthcare:speciality'],
      addrFull: json['properties']['addr:full'],
      addrCity: json['properties']['addr:city'],
      nameAr: json['properties']['name:ar'],
      osmId: json['properties']['osm_id'],
      osmType: json['properties']['osm_type'],
      coordinates: List<List<List<double>>>.from(
        json['geometry']['coordinates'].map<List<List<double>>>((coord) {
          return List<List<double>>.from(
            coord.map<List<double>>((subCoord) {
              return List<double>.from(subCoord.map<double>((e) => e.toDouble()));
            }),
          );
        }),
      ),
    );
  }

  factory GeoJsonFeature.fromGeoJsonString(String jsonString) {
    final Map<String, dynamic> parsed = json.decode(jsonString);
    return GeoJsonFeature.fromJson(parsed);
  }
}
