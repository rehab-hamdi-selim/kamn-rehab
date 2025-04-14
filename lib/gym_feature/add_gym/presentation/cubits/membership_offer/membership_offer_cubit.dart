import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/add_gym/data/repositories/add_gym_repository.dart';
import 'package:kamn/gym_feature/add_gym/domain/models/membership_plan.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';

@injectable
class MembershipOfferCubit extends Cubit<MembershipOfferState> {
  MembershipOfferCubit({required this.repository})
      : super(
            const MembershipOfferState(status: MembershipOfferStatus.initial)){
              discountPercentageController.addListener((){
                if(discountPercentageController.text.isNotEmpty){
                 refresh();
                }

              });
            }

  final AddGymRepository repository;
  final TextEditingController offerNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController freeMonthsController = TextEditingController();
  final TextEditingController discountPercentageController = TextEditingController();
  final TextEditingController priceAfterDiscountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  
  
  void refresh(){
    emit(state.copyWith(
      status: state.status, 
    ));
  }
  void addInterval() {
    // Check if required fields are available
    if (state.startTime == null || state.endTime == null || state.selectedDays == null || state.selectedDays!.isEmpty) {
      return;
    }

    final interval = IntervalSelected(
      start: state.startTime!,
      end: state.endTime!,
      days: List<String>.from(state.selectedDays!),
    );

    final currentIntervals = state.intervals ?? [];
    
    emit(state.copyWith(
      intervals: [...currentIntervals, interval],
      // Reset selection after adding interval
      selectedDays: [],
      startTime: null,
      endTime: null,
    ));
  }

  void toggleDiscount() {
    emit(state.copyWith(
      isDiscount: !(state.isDiscount!),
    ));
  }

  void toggle247Days() {
    emit(state.copyWith(
      is247Days: !(state.is247Days!),
    ));
  }

  void toggle24Hours(bool value) {
    if (value) {
      // When enabling 24 hours
      emit(state.copyWith(
        is24Hours: true,
        startTime: const TimeOfDay(hour: 0, minute: 0),
        endTime: const TimeOfDay(hour: 23, minute: 59),
      ));
    } else {
      // When disabling 24 hours, return to default times
      emit(state.copyWith(
        is24Hours: false,
        startTime: null,
        endTime: null,
      ));
    }
  }

  void addSelectedDay(String day) {
    final currentDays = state.selectedDays ?? [];
    if (currentDays.contains(day)) {
      emit(state.copyWith(
        selectedDays: currentDays.where((d) => d != day).toList(),
      ));
    } else {
      emit(state.copyWith(
        selectedDays: [...currentDays, day],
      ));
    }
  }

  void updateStartTime(TimeOfDay time) {
    emit(state.copyWith(startTime: time));
  }

  void updateEndTime(TimeOfDay time) {
    emit(state.copyWith(endTime: time));
  }

  void updatePlanDuration(PlanDuration duration) {
    emit(state.copyWith(
      planDuration: duration,
      status: MembershipOfferStatus.initial,
    ));
  }
  void updatedDiscountStartDate(DateTime date) {
    emit(state.copyWith(
      discountStartDate: date,
    ));
  }
  void updatedDiscountEndDate(DateTime date) {
    emit(state.copyWith(
      discountEndDate: date,
    ));
  }
  void updatePriceAfterDiscount(double price) {
      priceAfterDiscountController.text = price.toStringAsFixed(2);
      emit(state.copyWith(
        priceAfterDiscount: price.toString(),
      ));
    }
  void submitMembershipPlan() {
      final plan = MembershipPlan(
        planName: offerNameController.text,
        price: priceController.text,
        freeMonths: freeMonthsController.text,
        isDiscount: state.isDiscount ?? false,
        discountPercentage: discountPercentageController.text,
        priceAfterDiscount: priceAfterDiscountController.text,
        discountStartDate: state.discountStartDate,
        discountEndDate: state.discountEndDate,
        planDuration: state.planDuration,
        is247Days: state.is247Days ?? false,
        is24Hours: state.is24Hours ?? false,
        intervals: state.intervals,
        notes: notesController.text,
      );
  
      // Print the collected data
      print(plan.toString());
      
      // TODO: Add your API call or database operation here
    }
  
  @override
  Future<void> close() {
    offerNameController.dispose();
    priceController.dispose();
    freeMonthsController.dispose();
    discountPercentageController.dispose();
    priceAfterDiscountController.dispose();
    notesController.dispose();
    discountPercentageController.removeListener((){});
    return super.close();
  }
}
