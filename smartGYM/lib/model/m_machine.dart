
import 'package:flutter/material.dart';

class MachineModel {
  final String machineImageUrl;
  final String machineName;
  final String machineDescription;
  final String machineType;
  final bool isReservations;

  MachineModel(
      {required this.machineImageUrl,
      required this.machineName,
      required this.machineDescription,
      required this.machineType,
      required this.isReservations
      });
}
