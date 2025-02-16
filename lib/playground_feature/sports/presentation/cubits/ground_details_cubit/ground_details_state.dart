// ignore_for_file: public_member_api_docs, sort_constructors_first
enum GroundDetailsStatus {
  initial,
  isScrollingUp,
  isReturnedToTop,
  isScrolledDown
}

extension GroundDetailsStateExtension on GroundDetailsState {
  bool get isInitial => status == GroundDetailsStatus.initial;
  bool get isScrollingUp => status == GroundDetailsStatus.isScrollingUp;
  bool get isReturnedToTop => status == GroundDetailsStatus.isReturnedToTop; 
  bool get isScrolledDown => status == GroundDetailsStatus.isScrolledDown;
}
class GroundDetailsState {
  final GroundDetailsStatus status;
  GroundDetailsState({required this.status});

  GroundDetailsState copyWith({
    GroundDetailsStatus? status,
  }) {
    return GroundDetailsState(
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'GroundDetailsState(status: $status)';

  @override
  bool operator ==(covariant GroundDetailsState other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}
