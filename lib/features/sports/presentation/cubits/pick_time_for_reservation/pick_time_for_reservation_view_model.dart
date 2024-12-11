import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';

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
        .where((reservation) {
          List<Session> sessions = reservation.sessions ?? [];
          return sessions.any((session) {
            return DateFormat('yyyy-MM-dd').format(session.startAt) ==
                DateFormat('yyyy-MM-dd').format(selectedDate);
          });
        })
        .toList()
        .where((element) {
          return element.sessions!.any((element) {
            return DateFormat('yyyy-MM-ddHH:mm').format(element.startAt) ==
                DateFormat('yyyy-MM-ddHH:mm').format(interval);
          });
        })
        .toList()
        .isNotEmpty;
  }
}
