// SPDX-FileCopyrightText: 2024 Théo Magne <theo.magne@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

/// Utility class for [Duration] objects.
sealed class DurationUtility {
  /// This is the regular expression to parse a time zone offset string in the format of ±hh:mm
  static final timeZoneOffsetRegexp = RegExp('([+-])?([0-9]{1,2}):([0-9]{1,2})');

  /// This is the index of the sign group in the time zone offset regular expression
  static const _timeZoneOffsetSignIndex = 1;

  /// This is the index of the hours group in the time zone offset regular expression
  static const _timeZoneOffsetHoursIndex = 2;

  /// This is the index of the minutes group in the time zone offset regular expression
  static const _timeZoneOffsetMinutesIndex = 3;

  /// This is the sign used in time zone offset string to indicate a negative offset
  static const _timeZoneOffsetMinusSign = '-';

  /// This is the factor to apply to hours and minutes when the time zone offset is positive
  static const _timeZoneOffsetPositiveFactor = 1;

  /// This is the factor to apply to hours and minutes when the time zone offset is negative
  static const _timeZoneOffsetNegativeFactor = -1;

  /// Convenient getter to get a formatted duration string as m:ss
  static String? formatMinSec(Duration? duration) {
    if (duration == null) {
      return null;
    }

    final minutes = duration.inMinutes.toString();
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  /// Create a new [Duration] thanks to the given [seconds]
  ///
  /// This is useful for casting method which only expects one parameter
  static Duration? parseFromSeconds(int seconds) {
    if (seconds < 0) {
      return null;
    }

    return Duration(seconds: seconds);
  }

  /// Create a new [Duration] thanks to the given [milliseconds]
  ///
  /// This is useful for casting method which only expects one parameter
  static Duration? parseFromMilliseconds(int milliseconds) {
    if (milliseconds < 0) {
      return null;
    }

    return Duration(milliseconds: milliseconds);
  }

  /// Create a new [Duration] thanks to the given [timeZoneOffset] string in the format of ±hh:mm
  static Duration? parseFromTimeZoneOffset(String timeZoneOffset) {
    final match = timeZoneOffsetRegexp.firstMatch(timeZoneOffset);
    if (match == null) {
      return null;
    }

    if (match.groupCount < _timeZoneOffsetMinutesIndex) {
      return null;
    }

    final sign = match.group(_timeZoneOffsetSignIndex);

    var signFactor = _timeZoneOffsetPositiveFactor;
    if (sign == _timeZoneOffsetMinusSign) {
      signFactor = _timeZoneOffsetNegativeFactor;
    }

    final hoursGroup = match.group(_timeZoneOffsetHoursIndex);
    final minutesGroup = match.group(_timeZoneOffsetMinutesIndex);
    if (hoursGroup == null || minutesGroup == null) {
      return null;
    }

    final hours = int.tryParse(hoursGroup);
    final minutes = int.tryParse(minutesGroup);
    if (hours == null || minutes == null) {
      return null;
    }

    return Duration(hours: signFactor * hours, minutes: signFactor * minutes);
  }
}
