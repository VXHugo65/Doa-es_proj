import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String id;
  final String eventId;
  final String userId;
  final String content;
  
  const CommentModel({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.content,
  });

  CommentModel copyWith({
    String? id,
    String? eventId,
    String? userId,
    String? content,
  }) {
    return CommentModel(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'eventId': eventId});
    result.addAll({'userId': userId});
    result.addAll({'content': content});
  
    return result;
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      eventId: map['eventId'] ?? '',
      userId: map['userId'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentModel(id: $id, eventId: $eventId, userId: $userId, content: $content)';
  }

  @override
  List<Object> get props => [id, eventId, userId, content];
}
