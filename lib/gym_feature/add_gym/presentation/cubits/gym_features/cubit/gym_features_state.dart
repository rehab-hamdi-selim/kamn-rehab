// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GymFeaturesState extends Equatable {
  final String selectedValue;
  final String typedText;
  final bool isChecked;
  const GymFeaturesState({
     this.selectedValue = '',
     this.typedText = '',
     this.isChecked = false,
  });
  @override
  List<Object> get props => [selectedValue, typedText, isChecked];

  GymFeaturesState copyWith({
    String? selectedValue,
    String? typedText,
    bool? isCHecked,
  }) {
    return GymFeaturesState(
      selectedValue: selectedValue ?? this.selectedValue,
      typedText: typedText ?? this.typedText,
      isChecked: isCHecked ?? isChecked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedValue': selectedValue,
      'typedText': typedText,
      'isCHecked': isChecked,
    };
  }

  factory GymFeaturesState.fromMap(Map<String, dynamic> map) {
    return GymFeaturesState(
      selectedValue: map['selectedValue'] as String,
      typedText: map['typedText'] as String,
      isChecked: map['isCHecked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymFeaturesState.fromJson(String source) => GymFeaturesState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
