import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  bool isBefore(TimeOfDay comparable) {
    return convertTimeOfDayToDouble() < comparable.convertTimeOfDayToDouble();
  }

  bool isBeforeOrEqual(TimeOfDay comparable) {
    return convertTimeOfDayToDouble() <= comparable.convertTimeOfDayToDouble();
  }

  bool isAtSameTime(TimeOfDay comparable) {
    return convertTimeOfDayToDouble() == comparable.convertTimeOfDayToDouble();
  }

  bool isAfter(TimeOfDay comparable) {
    return convertTimeOfDayToDouble() > comparable.convertTimeOfDayToDouble();
  }

  bool isAfterOrEqual(TimeOfDay comparable) {
    return convertTimeOfDayToDouble() >= comparable.convertTimeOfDayToDouble();
  }

  double convertTimeOfDayToDoublePercent() {
    return (hour.toDouble() * 100 + (minute == 0 ? minute / 60 : minute));
  }

  double convertTimeOfDayToDouble() {
    return (hour.toDouble() * 100 + (minute == 0 ? minute / 60 : minute));
  }

  String convertToString(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(this, alwaysUse24HourFormat: true);
  }

  DateTime getDateTimeFromTimeOfDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  }
}
