// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Father {
  final int id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String career;
  final String placeOfResidence;
  final String tieNumber;
  final String tiePlace;
  final String placeOfBirth;
  final DateTime dateOfBirth;
  String civilRegisterSecretary;
  //enum
  final Religion religion;
  //enum
  final EducationalStatus educationalStatus;
  final String phoneNumber;

  final String permenantAddress;
  Father({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.career,
    required this.placeOfResidence,
    required this.tieNumber,
    required this.tiePlace,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.civilRegisterSecretary,
    required this.religion,
    required this.educationalStatus,
    required this.phoneNumber,
    required this.permenantAddress,
  });

  Father copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    String? career,
    String? placeOfResidence,
    String? tieNumber,
    String? tiePlace,
    String? placeOfBirth,
    DateTime? dateOfBirth,
    String? civilRegisterSecretary,
    Religion? religion,
    EducationalStatus? educationalStatus,
    String? phoneNumber,
    String? permenantAddress,
  }) {
    return Father(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      career: career ?? this.career,
      placeOfResidence: placeOfResidence ?? this.placeOfResidence,
      tieNumber: tieNumber ?? this.tieNumber,
      tiePlace: tiePlace ?? this.tiePlace,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      civilRegisterSecretary:
          civilRegisterSecretary ?? this.civilRegisterSecretary,
      religion: religion ?? this.religion,
      educationalStatus: educationalStatus ?? this.educationalStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      permenantAddress: permenantAddress ?? this.permenantAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'career': career,
      'placeOfResidence': placeOfResidence,
      'tieNumber': tieNumber,
      'tiePlace': tiePlace,
      'placeOfBirth': placeOfBirth,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'civilRegisterSecretary': civilRegisterSecretary,
      'religion': religion.index,
      'educationalStatus': educationalStatus.index,
      'phoneNumber': phoneNumber,
      'permenantAddress': permenantAddress,
    };
  }

  factory Father.fromMap(Map<String, dynamic> map) {
    return Father(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      fatherName: map['fatherName'] as String,
      motherName: map['motherName'] as String,
      career: map['career'] as String,
      placeOfResidence: map['placeOfResidence'] as String,
      tieNumber: map['tieNumber'] as String,
      tiePlace: map['tiePlace'] as String,
      placeOfBirth: map['placeOfBirth'] as String,
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      civilRegisterSecretary: map['civilRegisterSecretary'] as String,
      religion: Religion.values[map['religion'] as int],
      educationalStatus:
          EducationalStatus.values[map['educationalStatus'] as int],
      phoneNumber: map['phoneNumber'] as String,
      permenantAddress: map['permenantAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Father.fromJson(String source) =>
      Father.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Father(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, motherName: $motherName, career: $career, placeOfResidence: $placeOfResidence, tieNumber: $tieNumber, tiePlace: $tiePlace, placeOfBirth: $placeOfBirth, dateOfBirth: $dateOfBirth, civilRegisterSecretary: $civilRegisterSecretary, religion: $religion, educationalStatus: $educationalStatus, phoneNumber: $phoneNumber, permenantAddress: $permenantAddress)';
  }

  @override
  bool operator ==(covariant Father other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.fatherName == fatherName &&
        other.motherName == motherName &&
        other.career == career &&
        other.placeOfResidence == placeOfResidence &&
        other.tieNumber == tieNumber &&
        other.tiePlace == tiePlace &&
        other.placeOfBirth == placeOfBirth &&
        other.dateOfBirth == dateOfBirth &&
        other.civilRegisterSecretary == civilRegisterSecretary &&
        other.religion == religion &&
        other.educationalStatus == educationalStatus &&
        other.phoneNumber == phoneNumber &&
        other.permenantAddress == permenantAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        fatherName.hashCode ^
        motherName.hashCode ^
        career.hashCode ^
        placeOfResidence.hashCode ^
        tieNumber.hashCode ^
        tiePlace.hashCode ^
        placeOfBirth.hashCode ^
        dateOfBirth.hashCode ^
        civilRegisterSecretary.hashCode ^
        religion.hashCode ^
        educationalStatus.hashCode ^
        phoneNumber.hashCode ^
        permenantAddress.hashCode;
  }
}
