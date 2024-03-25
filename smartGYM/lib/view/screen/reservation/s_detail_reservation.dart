import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/common/colors/color_palette.dart';
import 'package:gym_app/model/m_auth.dart';
import 'package:gym_app/model/m_machine.dart';
import 'package:gym_app/provider/auth/auth_provider.dart';
import 'package:gym_app/view/screen/reservation/w_detail/TimeSlotTile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../provider/machine/machine_provider.dart';

class DetailMachineReservationScreen extends ConsumerStatefulWidget {
  const DetailMachineReservationScreen({super.key, required this.machineName});

  final String machineName;

  @override
  ConsumerState<DetailMachineReservationScreen> createState() =>
      _DetailMachineReservationState();
}

class _DetailMachineReservationState
    extends ConsumerState<DetailMachineReservationScreen> {
  @override
  Widget build(BuildContext context) {
    final MachineModel machine = ref
        .watch(machineListProvider.notifier)
        .getMachineByName(widget.machineName);

    return Scaffold(
      appBar: AppBar(
        title: Text(machine.machineName),
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView 추가
        child: Column(
          children: [
            // Image and description section
            _MachineImages(machine: machine),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('시간 선택', style: TextStyle(fontSize: 15, color: ColorPalette.primaryColor),),
              ],
            ),
            TimeSlotTile(timeIndex: 0, machineName: machine.machineName,),
            TimeSlotTile(timeIndex: 1, machineName: machine.machineName,),
            TimeSlotTile(timeIndex: 2, machineName: machine.machineName,),
            BottomAppBar(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () async {
                        final uri = Uri.parse(machine.youtubeUrl);
                        if (!await launchUrl(uri)) {
                        throw Exception('Could not launch $uri');
                        }                      },
                      child: const Text('YouTube 바로가기')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }





}

class _MachineImages extends StatelessWidget {
  const _MachineImages({
    super.key,
    required this.machine,
  });

  final MachineModel machine;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: machine.machineImageUrl,
                child: Image.asset(
                  machine.machineImageUrl,
                  fit: BoxFit.contain,
                  height: 250.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(machine.machineDescription,
                  style: const TextStyle(fontSize: 16.0)),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
        Positioned(
            top: 16.0,
            left: 16.0,
            child: Text(
              '#${machine.machineType}',
              style: const TextStyle(
                  fontSize: 15.0,
                  color: ColorPalette.primaryColor,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
