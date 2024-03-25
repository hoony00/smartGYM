import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailMachineReservationScreen extends ConsumerStatefulWidget {
  const DetailMachineReservationScreen({super.key, required this.machineName});
  final String machineName;

  @override
  ConsumerState<DetailMachineReservationScreen> createState() => _DetailMachineReservationState();
}

class _DetailMachineReservationState extends ConsumerState<DetailMachineReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machineName),
      ),
      body: Center(
        child: Text(widget.machineName),
      ),
    );
  }
}
