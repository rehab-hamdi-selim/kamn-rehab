import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';

class MembershipPlan {
  final String planName;
  final String price;
  final String? freeMonths;
  final bool isDiscount;
  final String? discountPercentage;
  final String? priceAfterDiscount;
  final DateTime? discountStartDate;
  final DateTime? discountEndDate;
  final PlanDuration? planDuration;
  final bool is247Days;
  final bool is24Hours;
  final List<IntervalSelected>? intervals;
  final String? notes;

  MembershipPlan({
    required this.planName,
    required this.price,
    this.freeMonths,
    required this.isDiscount,
    this.discountPercentage,
    this.priceAfterDiscount,
    this.discountStartDate,
    this.discountEndDate,
    this.planDuration,
    required this.is247Days,
    required this.is24Hours,
    this.intervals,
    this.notes,
  });

  @override
  String toString() {
    return '''
MembershipPlan(
  planName: $planName,
  price: $price,
  freeMonths: $freeMonths,
  isDiscount: $isDiscount,
  discountPercentage: $discountPercentage,
  priceAfterDiscount: $priceAfterDiscount,
  discountStartDate: $discountStartDate,
  discountEndDate: $discountEndDate,
  planDuration: $planDuration,
  is247Days: $is247Days,
  is24Hours: $is24Hours,
  intervals: $intervals,
  notes: $notes
)''';
  }
}