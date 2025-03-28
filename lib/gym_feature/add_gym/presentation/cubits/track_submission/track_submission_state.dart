// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';

enum TrackSubmissionStatus {
  initial,
  loading,
  success,
  error,
  submissionReceived,
  underReview,
  approved,
  pending,
  rejected
}

class TrackSubmissionState {
  final TrackSubmissionStatus status;
  final String? errorMessage;
  final List<bool?> stepsCompleted;
   final List<StepInfo> stepsInfo;
   final GymRequestModel? gymRequestModel;

  
static final List<StepInfo> defaultStepsInfo = [
    StepInfo(
      title: "Submission Received",
      description:
          "Your submission has been successfully received and logged into our system.",
      icon: SvgPicture.asset('assets/icons/check.svg'),
      status: StepStatus.pending,
    ),
    StepInfo(
      title: "Under Review",
      description:
          "Our team is reviewing your gym's details, documents, and membership plans to ensure compliance with policies.",
      icon: SvgPicture.asset('assets/icons/under_review.svg'),
      status: StepStatus.pending,
    ),
    StepInfo(
      title: "Approval",
      description:
          "Once the review is complete, we will notify you about the approval or required changes.",
      icon: SvgPicture.asset('assets/icons/approval.svg'),
      status: StepStatus.pending,
    ),
  ];
  TrackSubmissionState({
    List<StepInfo>? stepsInfo, // Optional parameter
    required this.status,
    this.errorMessage,
    this.stepsCompleted = const [true, null,true],
    this.gymRequestModel,
  }) : stepsInfo = stepsInfo ?? List.from(defaultStepsInfo); 
  TrackSubmissionState copyWith({
    TrackSubmissionStatus? status,
    String? errorMessage,
    List<bool?>? stepsCompleted,
    List<StepInfo>? stepsInfo,
    GymRequestModel? gymRequestModel,
  }) {
    return TrackSubmissionState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      stepsCompleted: stepsCompleted ?? this.stepsCompleted,
      stepsInfo: stepsInfo ?? this.stepsInfo,
      gymRequestModel: gymRequestModel ?? this.gymRequestModel,
    );
  }

  

  @override
  String toString() {
    return 'TrackSubmissionState(status: $status, errorMessage: $errorMessage, stepsCompleted: $stepsCompleted, stepsInfo: $stepsInfo,)';
  }
}

extension TrackSubmissionStateX on TrackSubmissionState {
  bool get isInitial => status == TrackSubmissionStatus.initial;
  bool get isLoading => status == TrackSubmissionStatus.loading;
  bool get isSuccess => status == TrackSubmissionStatus.success;
  bool get isError => status == TrackSubmissionStatus.error;
  bool get isSubmissionReceived =>
      status == TrackSubmissionStatus.submissionReceived;
  bool get isUnderReview => status == TrackSubmissionStatus.underReview;
  bool get isApproved => status == TrackSubmissionStatus.approved;
  bool get isPending => status == TrackSubmissionStatus.pending;
  bool get isRejected => status == TrackSubmissionStatus.rejected;
}
extension StepsInfoX on StepInfo {
  Color get color {
    switch (status) {
      case StepStatus.completed:
        return AppPallete.green;
      case StepStatus.failed:
        return AppPallete.red;
      case StepStatus.current:
        return AppPallete.orangeColor;
      default:
        return AppPallete.grayColor;
    }
  }
}
class StepInfo {
  final String title;
  final String description;
  final SvgPicture icon;
  final StepStatus status;

  const StepInfo(
      {required this.title,
      required this.description,
      required this.icon,
      required this.status});

  StepInfo copyWith({
    String? title,
    String? description,
    SvgPicture? icon,
    StepStatus? status,
  }) {
    return StepInfo(
     title: title ?? this.title,
     description: description ?? this.description,
    icon:  icon ?? this.icon,
     status: status ?? this.status,
    );
  }
}

enum StepStatus {
  completed,
  failed,
  current,
  pending,
}
