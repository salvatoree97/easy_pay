// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String? convertDateTimeToString() {
    try {
      DateFormat dayNameFormat = DateFormat("EEE dd MMM | HH:mm");
      return toBeginningOfSentenceCase(dayNameFormat.format(this));
    } catch (e) {
      return "";
    }
  }

  String? ddMMyyyyHourHHmm() {
    try {
      if (day == DateTime.now().day) {
        DateFormat dateFormat = DateFormat("Oggi, Ore HH:mm");
        return dateFormat.format(this);
      }
      DateFormat dateFormat = DateFormat("dd/MM/yyyy, Ore HH:mm");
      return dateFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String ddMMyyyyHHMM() {
    try {
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      return dateFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String ddMMyyyy() {
    try {
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      return dateFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String ddMMM() {
    try {
      if (day == DateTime.now().day) {
        DateFormat dateFormat = DateFormat("Oggi");
        return dateFormat.format(this);
      }
      DateFormat dateFormat = DateFormat("dd MMM");
      return dateFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String ddMMMyyyy() {
    try {
      if (day == DateTime.now().day) {
        DateFormat dateFormat = DateFormat("Oggi");
        return dateFormat.format(this);
      }
      DateFormat dateFormat = DateFormat("dd MMM yyyy");
      return dateFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String ddMMMMyyyyWithSpace() {
    try {
      DateFormat dateFormat = DateFormat("dd MMMM yyyy");
      return dateFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String? formatToWeekDayFormat() {
    try {
      DateFormat dayNameFormat = DateFormat("EEE dd MMM");
      return toBeginningOfSentenceCase(dayNameFormat.format(this));
    } catch (e) {
      return "";
    }
  }

  String HHmm() {
    try {
      DateFormat dayNameFormat = DateFormat("HH:mm");
      return dayNameFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String formatToHourMinuteAndSecondsFormat() {
    try {
      DateFormat dayNameFormat = DateFormat("HH:mm:ss");
      return dayNameFormat.format(this);
    } catch (e) {
      return "";
    }
  }

  String formatDayStringMonth() {
    try {
      DateFormat monthFormat = DateFormat("dd MMM");
      return monthFormat.format(this).toLowerCase();
    } catch (e) {
      return "";
    }
  }

  String formatDayMonthYearString() {
    try {
      return DateFormat("dd MMM yyyy").format(this).toUpperCase();
    } catch (e) {
      return "";
    }
  }

  int convertDateTimeToTimeStamp() {
    Duration duration = DateTime.now().timeZoneOffset;
    return toUtc().millisecondsSinceEpoch + duration.inMilliseconds;
  }

  bool isDateBeforeOrEqual(DateTime comparator) {
    return isBefore(comparator) || isAtSameMomentAs(comparator);
  }

  bool isDateAfterOrEqual(DateTime comparator) {
    return isAfter(comparator) || isAtSameMomentAs(comparator);
  }

  bool isDateAfter(DateTime comparator) {
    return isAfter(comparator);
  }

  bool isDateBefore(DateTime comparator) {
    return isBefore(comparator);
  }

  bool isSameDayAs(DateTime comparator) {
    return day == comparator.day &&
        month == comparator.month &&
        year == comparator.year;
  }
}

extension DateTimeStringExtension on String {
  DateTime parseDateTime() {
    try {
      return DateFormat("dd/MM/yyyy-HH:mm").parse(this);
    } catch (ex) {
      return DateTime.now();
    }
  }
}
