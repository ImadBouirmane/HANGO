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

String? getPourcentageValue(double? entranceValue) {
  // get the percentage value
  if (entranceValue == null) {
    return null;
  }
  final percentage = entranceValue * 100;
  return '${percentage.toStringAsFixed(2)}%';
}

int? timeEnd(DateTime? trackTime) {
  // get time end
  if (trackTime == null) {
    return null;
  }
  final hour = trackTime.hour;
  if (hour >= 0 && hour < 6) {
    return 6;
  } else if (hour >= 6 && hour < 12) {
    return 12;
  } else if (hour >= 12 && hour < 18) {
    return 18;
  } else {
    return 24;
  }
}

DateTime? getTimeDuration(
  DateTime? startTrack,
  DateTime? endTrack,
) {
  // calculate the average date time
  if (startTrack == null || endTrack == null) {
    return null;
  }

  final averageMilliseconds =
      (endTrack.millisecondsSinceEpoch - startTrack.millisecondsSinceEpoch) ~/
          2;
  final averageDateTime =
      startTrack.add(Duration(milliseconds: averageMilliseconds));
  return averageDateTime;
}

String? textFormat(
  String? userName,
  String? promotionTitle,
  String? promotionSubTitle,
  String? promotionMessage,
  DateTime? birthDay,
  String? establishmentName,
  String? eventTitle,
  DateTime? eventDate,
) {
  // format the text string for make as pragraphs
  return '''
Salut $userName,

C'est avec une super nouvelle que nous t'annonçons que tu as décroché une entrée gratuite pour le festival La Belle Nuit ! Yep, tu as bien lu, en créant ton compte sur l'appli Hango et en choisissant l'un des événement top dont on a parlé, tu as gagné ton ticket d'or pour une soirée de folie. L'équipe Hango et notre partenaire {establishment name} te remercions d'utiliser l'application.

Détails de la promotion :
$promotionTitle
$promotionSubTitle
$promotionMessage

C'est ton moment de briller ! Pour profiter de cette promotion, il te suffit de te pointer à l'entrée du club que tu as sélectionné dans l'appli. On t'ajoutera à notre liste VIP, et tu seras prêt(e) à te laisser emporter par l'ambiance électrisante de La Belle Nuit. Présente l'email suivant avec un document d'identité valable à la personne responsable de vérifier les entrées. 

Lis bien l'email jusqu'au bout surtout la partie "ATTENTION"

Nom Complet : $userName
Date de naissance : $birthDay

Nom de l'établissement : $establishmentName
Evénement : $eventTitle
Date de l'événement : $eventDate

!!! ATTENTION !!!
- Les personnes sans documents d'identité valables se veront refuser leurs promotions.
- Les promotion ont une durée limitée dans le temps (la validité de l'offre est indiquée dans les détails de la promotions)
- Les promotions sont nominatives

On t'attend en forme pour faire la fête, parle en aussi a tes amis il reste peut-être des promotions encore disponibles.

L'équipe Hango
La Belle Nuit
$establishmentName

''';
}
