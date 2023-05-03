// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/configs/assets.dart';

class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final bool isMale;
  DateTime dateOfBirth;
  // String phoneNumber;
  DateTime startDate;
  int numberOfChildren;
  int jobTitleId;
  int addressId;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    this.isMale = true,
    required this.dateOfBirth,
    required this.startDate,
    required this.numberOfChildren,
    required this.jobTitleId,
    required this.addressId,
  });

  String getAvatarImage({bool circular = false}) {
    if (circular) {
      if (isMale) {
        return GlobalAssets.maleAvatarCircular;
      } else {
        return GlobalAssets.femaleAvatarCircular;
      }
    }
    if (isMale) {
      return GlobalAssets.maleAvatar;
    }
    return GlobalAssets.femaleAvatar;
  }

  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    bool? isMale,
    DateTime? dateOfBirth,
    DateTime? startDate,
    int? numberOfChildren,
    int? jobTitleId,
    int? addressId,
  }) {
    return Employee(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      isMale: isMale ?? this.isMale,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      startDate: startDate ?? this.startDate,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      jobTitleId: jobTitleId ?? this.jobTitleId,
      addressId: addressId ?? this.addressId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'isMale': isMale,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'startDate': startDate.toIso8601String(),
      'numberOfChildren': numberOfChildren,
      'jobTitleId': jobTitleId,
      'addressId': addressId,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      fatherName: map['fatherName'] as String,
      motherName: map['motherName'] as String,
      isMale: map['isMale'] as bool,
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      startDate: DateTime.parse(map['startDate']),
      numberOfChildren: map['numberOfChildren'] as int,
      jobTitleId: map['jobTitleId'] as int,
      addressId: map['addressId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Employee(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, motherName: $motherName, isMale: $isMale, dateOfBirth: $dateOfBirth, startDate: $startDate, numberOfChildren: $numberOfChildren, jobTitleId: $jobTitleId, addressId: $addressId)';
  }

  @override
  bool operator ==(covariant Employee other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.fatherName == fatherName &&
        other.motherName == motherName &&
        other.isMale == isMale &&
        other.dateOfBirth == dateOfBirth &&
        other.startDate == startDate &&
        other.numberOfChildren == numberOfChildren &&
        other.jobTitleId == jobTitleId &&
        other.addressId == addressId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        fatherName.hashCode ^
        motherName.hashCode ^
        isMale.hashCode ^
        dateOfBirth.hashCode ^
        startDate.hashCode ^
        numberOfChildren.hashCode ^
        jobTitleId.hashCode ^
        addressId.hashCode;
  }
}
