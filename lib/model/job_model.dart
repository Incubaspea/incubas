import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class JobModel {
  final String id;
  final String idofficer;
  final String job;
  final String detali;
  final String lat;
  final String lng;
  final String pathimage;
  final String status;
  JobModel({
    required this.id,
    required this.idofficer,
    required this.job,
    required this.detali,
    required this.lat,
    required this.lng,
    required this.pathimage,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'iofficer': idofficer,
      'job': job,
      'detail': detali,
      'lat': lat,
      'Lng': lng,
      'pathimage': pathimage,
      'status': status,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] ?? '' as String,
      idofficer: map['idofficer'] ?? '' as String,
      job: map['job'] ?? '' as String,
      detali: map['detali'] ?? '' as String,
      lat: map['lat'] ?? '' as String,
      lng: map['lng'] ?? '' as String,
      pathimage: map['pathimage'] ?? '' as String,
      status: map['status'] ?? '' as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
