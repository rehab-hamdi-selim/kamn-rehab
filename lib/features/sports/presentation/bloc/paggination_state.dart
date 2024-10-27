part of 'paggination_bloc.dart';

enum PagginationStatus { initial, loading, loadMore, success, failure }

extension PagginationStateExtension on PagginationState {
  bool get isInitial => status == PagginationStatus.initial;
  bool get isLoading => status == PagginationStatus.loading;
  bool get isLoadMore => status == PagginationStatus.loadMore;
  bool get isSuccess => status == PagginationStatus.success;
  bool get isFailure => status == PagginationStatus.failure;
}

class PagginationState {
  final PagginationStatus status;
  final List<dynamic>? data;
  final String? errorMessage;
  final bool hasReachedEnd;

  const PagginationState({
    required this.status,
    this.data,
    this.errorMessage,
    this.hasReachedEnd = false,
  });

  factory PagginationState.initial() =>
      const PagginationState(status: PagginationStatus.initial);

  PagginationState copyWith({
    PagginationStatus? status,
    List<dynamic>? data,
    String? errorMessage,
    bool? hasReachedEnd,
  }) {
    return PagginationState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
    );
  }
}
