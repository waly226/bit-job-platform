import 'package:cloud_firestore/cloud_firestore.dart';

class OffersModel {
  DocumentReference<Map<String, dynamic>>? id;
  String title;
  String type;
  List coverPicture;
  DateTime posteDate;
  DateTime applicationDeadline;
  String description;
  String field;
  String location;
  List? requirements;
  List? skills;
  List? benefits;

  OffersModel({
    required this.title,
    required this.type,
    required this.coverPicture,
    required this.posteDate,
    required this.applicationDeadline,
    required this.field,
    required this.location,
    required this.description,
    required this.requirements,
    required this.skills,
    required this.benefits,
  });

  OffersModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          type: json['type'],
          description: json['description'],
          coverPicture: json['coverPicture'],
          posteDate: (json['posteDate'] as Timestamp).toDate(),
          applicationDeadline:
              (json['applicationDeadline'] as Timestamp).toDate(),
          field: json['field'],
          location: json['location'],
          requirements: List<String>.from(json['requirements']),
          skills: List<String>.from(json['skills']),
          benefits: List<String>.from(json['benefits']),
        );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['coverPicture'] = this.coverPicture;
    data['posteDate'] = this.posteDate;
    data['applicationDeadline'] = this.applicationDeadline;
    data['field'] = this.posteDate;
    data['location'] = this.field;
    data['requirements'] = this.location;
    data['skills'] = this.requirements;
    data['benefits'] = this.skills;
    return data;
  }
}