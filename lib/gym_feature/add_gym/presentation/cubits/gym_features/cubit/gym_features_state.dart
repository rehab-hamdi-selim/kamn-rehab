// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GymFeaturesState extends Equatable {
  final String selectedValue;
  final String priceText;
  final String descriptionText;
  final bool isChecked;
  const GymFeaturesState({
    this.descriptionText = '' ,
     this.selectedValue = '',
     this.priceText = '',
     this.isChecked = false,
  });
  @override
  // TODO: implement props
  List<Object> get props => [selectedValue, priceText,descriptionText, isChecked];

  GymFeaturesState copyWith({
    String? selectedValue,
    String? priceText,
    String? descriptionText,
    bool? isChecked, 
  }) {
    return GymFeaturesState(
      selectedValue: selectedValue ?? this.selectedValue,
      priceText: priceText ?? this.priceText,
      descriptionText: descriptionText ?? this.descriptionText,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedValue': selectedValue,
      'priceText': priceText,
      'descriptionText': descriptionText,
      'isCHecked': isChecked,
    };
  }

  factory GymFeaturesState.fromMap(Map<String, dynamic> map) {
    return GymFeaturesState(
      selectedValue: map['selectedValue'] as String,
      priceText: map['priceText'] as String,
      descriptionText: map['descriptionText'] as String,
      isChecked: map['isChecked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymFeaturesState.fromJson(String source) => GymFeaturesState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class FeatureTyping extends GymFeaturesState{
  const FeatureTyping() : super();
  @override
  List<Object> get props => super.props;
}
class FeatureAdded extends GymFeaturesState{
    const FeatureAdded() : super();
  @override
  List<Object> get props => super.props;
}
class FeatureError extends GymFeaturesState{
    const FeatureError() : super();
  @override
  List<Object> get props => super.props;
}
