import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

@injectable
class PickTimeForReservationViewModel {
  Map<String, List<DateTime>> selectedIntervals = {};

  DateTime copyDate({required DateTime first, required DateTime second}) {
    return first.copyWith(
      day: second.day,
      month: second.month,
      year: second.year,
    );
  }

  bool isSelected(DateTime interval, String day) {
    if (selectedIntervals.containsKey(day)) {
      return selectedIntervals[day]!.contains(interval);
    }
    return false;
  }

  isInside(List<ReservationModel> reservationList, DateTime interval,
      DateTime selectedDate) {
    return reservationList
        .where((element) {
          return element.sessions!.any((element) {
            return DateFormat('yyyy-MM-ddHH:mm').format(element.startAt) ==
                DateFormat('yyyy-MM-ddHH:mm').format(interval);
          });
        })
        .toList()
        .isNotEmpty;
  }
  DateTime getEndTime(DateTime interval,int period) {  
    return interval.add( Duration(minutes: period));
  }
}
