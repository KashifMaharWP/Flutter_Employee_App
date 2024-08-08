

import 'dart:async';
import 'dart:developer';

import 'package:employee_management_app/Model/UserModel.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Provider/attendanceProvider.dart';
import 'package:employee_management_app/Utills/Global%20Class/GlobalAPI.dart';
import 'package:employee_management_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

  Future<void> getCurrentLocationCheckInTime(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    }
    else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      final atdProvider = Provider.of<AttendanceProvider>(context, listen: false);
      await atdProvider.AddCheckIn(currentPosition.latitude, currentPosition.longitude,context);
    }
  }

  getCurrentLocationCheckOutTime(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");

      LocationPermission ask = await Geolocator.requestPermission();
    }
    else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      final atdProvider = Provider.of<AttendanceProvider>(context, listen: false);
      atdProvider.AddCheckOut(currentPosition.latitude, currentPosition.longitude,context);
    }
  }
