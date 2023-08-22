import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? ageCalculated(DateTime? datePicked) {
  // get age from the date picked
  if (datePicked == null) {
    return null;
  }
  final now = DateTime.now();
  int age = now.year - datePicked.year;
  if (now.month < datePicked.month ||
      (now.month == datePicked.month && now.day < datePicked.day)) {
    age--;
  }
  return age;
}

bool? checkDay(DateTime? today) {
  // check if today is saturday or sunday
  if (today == null) {
    return null;
  }
  return today.weekday == DateTime.saturday || today.weekday == DateTime.sunday;
}

bool? entranceAvailability(DateTime? dateTimeNow) {
  // check dateTimeNow if it's month 8 or 9 or 10 of 2023 then return true and count 30 minutes
  if (dateTimeNow == null) {
    return null;
  }
  if (dateTimeNow.year != 2023) {
    return false;
  }
  final month = dateTimeNow.month;
  if (month < 8 || month > 10) {
    return false;
  }
  final minutes = dateTimeNow.minute;
  final hour = dateTimeNow.hour;
  if (hour < 8 || hour > 20) {
    return false;
  }
  if (hour == 20 && minutes > 30) {
    return false;
  }
  return true;
}

String? timeCheck(DateTime? timeNow) {
  // get a message based on current time for morning, evening and night
  if (timeNow == null) return null;

  final hour = timeNow.hour;

  if (hour < 12) {
    return 'Bonne journée';
  } else if (hour < 18) {
    return 'Bonne après-midi';
  } else {
    return 'Bonne soirée';
  }
}
