import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final UserDesignation designation;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.designation,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    UserDesignation? designation,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      designation: designation ?? this.designation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'designation': designation.name});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'].toString() ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      designation: _formartDesignation(map['designation']),
      // designation: UserDesignation.values
      //     .firstWhere((d) => d.name == map['designation']),
    );
  }

  static _formartDesignation(String des) {
    if (des == "Organization") {
      return UserDesignation.Organization;
    }
    if (des == "Normal") {
      return UserDesignation.Normal;
    }
    // return UserDesignation.Normal;
    return UserDesignation.Organization;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(id: $id, name: $name, email: $email, designation: $designation)';
  // String toString() => 'UserModel(name: $name, email: $email, designation: $designation)';

  @override
  List<Object> get props => [id, name, email, designation];
}

// ignore: constant_identifier_names
enum UserDesignation { Normal, Organization }
