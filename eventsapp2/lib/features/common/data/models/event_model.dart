import 'dart:convert';

import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String name;
  // final DateTime date;
  // final DateTime time;
  final String date;
  final String time;
  final String location;
  final String type;
  final String organizationName;
  final String donationMethods;
  final String donationGoal;
  final String donationProgress;
  // final double donationGoal;
  // final double donationProgress;
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
    String? date,
    String? time,
    String? location,
    String? type,
    String? organizationName,
    String? donationMethods,
    String? donationGoal,
    String? donationProgress,
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
      // donationGoal: donationGoal ?? this.donationGoal,
      // donationProgress: donationProgress ?? this.donationProgress,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'EventID': id});
    result.addAll({'EventName': name});
    result.addAll({'EventDate': date});
    result.addAll({'EventTime': time});
    // result.addAll({'date': date.millisecondsSinceEpoch});
    // result.addAll({'time': time.millisecondsSinceEpoch});
    result.addAll({'Location': location});
    result.addAll({'EventType': type});
    result.addAll({'OrganizationName': organizationName});
    result.addAll({'DonationMethods': donationMethods});
    result.addAll({'DonationGoal': donationGoal});
    result.addAll({'DonationProgress': donationProgress});
    result.addAll({'EventName': description});

    return result;
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['EventID'].toString() ?? "",
      // id: int.parse(map['EventID']) ?? 0,
      name: map['EventName'] ?? '',
      date: map['EventDate'].toString(),
      time: map['EventTime'].toString(),
      // date: DateTime.fromMillisecondsSinceEpoch(map['EventDate']),
      // time: DateTime.fromMillisecondsSinceEpoch(map['EventTime']),
      location: map['Location'] ?? '',
      type: map['EventType'] ?? '',
      organizationName: map['OrganizationName'] ?? '',
      donationMethods: map['DonationMethods'],
      // donationMethods: List<String>.from(map['donationMethods']),
      donationGoal: map['DonationGoal'] ?? 0.0,
      donationProgress: map['DonationProgress'] ?? 0.0,
      // donationGoal: map['DonationGoal']?.toDouble() ?? 0.0,
      // donationProgress: map['DonationProgress']?.toDouble() ?? 0.0,
      description: map['EventName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

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
