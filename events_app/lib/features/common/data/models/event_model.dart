import 'dart:convert';

import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String name;
  final DateTime date;
  final DateTime time;
  final String location;
  final String type;
  final String organizationName;
  final List<String> donationMethods;
  final double donationGoal;
  final double donationProgress;
  final String description;
  
  const EventModel({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.type,
    required this.organizationName,
    required this.donationMethods,
    required this.donationGoal,
    required this.donationProgress,
    required this.description,
  });

  EventModel copyWith({
    String? id,
    String? name,
    DateTime? date,
    DateTime? time,
    String? location,
    String? type,
    String? organizationName,
    List<String>? donationMethods,
    double? donationGoal,
    double? donationProgress,
    String? description,
  }) {
    return EventModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      type: type ?? this.type,
      organizationName: organizationName ?? this.organizationName,
      donationMethods: donationMethods ?? this.donationMethods,
      donationGoal: donationGoal ?? this.donationGoal,
      donationProgress: donationProgress ?? this.donationProgress,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'time': time.millisecondsSinceEpoch});
    result.addAll({'location': location});
    result.addAll({'type': type});
    result.addAll({'organizationName': organizationName});
    result.addAll({'donationMethods': donationMethods});
    result.addAll({'donationGoal': donationGoal});
    result.addAll({'donationProgress': donationProgress});
    result.addAll({'description': description});
  
    return result;
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      location: map['location'] ?? '',
      type: map['type'] ?? '',
      organizationName: map['organizationName'] ?? '',
      donationMethods: List<String>.from(map['donationMethods']),
      donationGoal: map['donationGoal']?.toDouble() ?? 0.0,
      donationProgress: map['donationProgress']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    // return 'EventModel(name: $name, date: $date, time: $time, location: $location, type: $type, organizationName: $organizationName, donationMethods: $donationMethods, donationGoal: $donationGoal, donationProgress: $donationProgress, description: $description)';
    return 'EventModel(id: $id, name: $name, date: $date, time: $time, location: $location, type: $type, organizationName: $organizationName, donationMethods: $donationMethods, donationGoal: $donationGoal, donationProgress: $donationProgress, description: $description)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      date,
      time,
      location,
      type,
      organizationName,
      donationMethods,
      donationGoal,
      donationProgress,
      description,
    ];
  }
}
