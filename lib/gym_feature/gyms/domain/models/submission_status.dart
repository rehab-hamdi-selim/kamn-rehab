enum SubmissionStatus { pending, underReview, approved, rejected }

class SubmissionModel {
  final SubmissionStatus status;
  final String message;

  SubmissionModel({
    required this.status,
    required this.message,
  });

  SubmissionModel copyWith({
    SubmissionStatus? status,
    String? message,
  }) {
    return SubmissionModel(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
