// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kamn/features/sports/data/models/playground_model.dart';

class CategoryData {
  final String title ;
  final List<PlaygroundModel> data;
  CategoryData({
    required this.title,
    required this.data,
  });

  CategoryData copyWith({
    String? title ,
    List<PlaygroundModel>? data,
  }) {
    return CategoryData(
      title: title ?? this.title,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryData.fromMap(Map<String, dynamic> map) {
    return CategoryData(
      title:map['title'] as String,
      data: List<PlaygroundModel>.from((map['data'] as List<int>).map<PlaygroundModel>((x) => PlaygroundModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryData.fromJson(String source) => CategoryData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryData(title: $title, data: $data)';

  @override
  bool operator ==(covariant CategoryData other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => title.hashCode ^ data.hashCode;
}
