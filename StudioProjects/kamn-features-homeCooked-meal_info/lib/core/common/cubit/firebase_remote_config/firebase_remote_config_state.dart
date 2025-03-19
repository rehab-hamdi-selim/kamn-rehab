enum FirebaseRemoteConfigStatus {
  initial,
  loading,
  success,
  failure,
  fetchAndActivate,
  getValue,
}

extension FirebaseRemoteConfigStateExtension on FirebaseRemoteConfigState {
  bool get isInitial => state == FirebaseRemoteConfigStatus.initial;
  bool get isLoading => state == FirebaseRemoteConfigStatus.loading;
  bool get isSuccess => state == FirebaseRemoteConfigStatus.success;
  bool get isFailure => state == FirebaseRemoteConfigStatus.failure;
  bool get isFetchAndActivate =>
      state == FirebaseRemoteConfigStatus.fetchAndActivate;
  bool get isGetValue => state == FirebaseRemoteConfigStatus.getValue;
}

class FirebaseRemoteConfigState {
  final FirebaseRemoteConfigStatus state;
  final String? errorMessage;
  final Map<String, dynamic>? configValues;
  final bool? isEnabled;

  FirebaseRemoteConfigState({
    required this.state,
    this.errorMessage,
    this.configValues,
    this.isEnabled,
  });

  FirebaseRemoteConfigState copyWith({
    FirebaseRemoteConfigStatus? state,
    String? errorMessage,
    Map<String, dynamic>? configValues,
    bool? isEnabled,
  }) {
    return FirebaseRemoteConfigState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      configValues: configValues ?? this.configValues,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  String toString() {
    return 'FirebaseRemoteConfigState(state: $state, errorMessage: $errorMessage, configValues: $configValues, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(covariant FirebaseRemoteConfigState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        other.errorMessage == errorMessage &&
        other.configValues == configValues &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        errorMessage.hashCode ^
        configValues.hashCode ^
        isEnabled.hashCode;
  }
}
