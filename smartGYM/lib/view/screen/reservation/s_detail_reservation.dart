import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/common/colors/color_palette.dart';
import 'package:gym_app/model/m_machine.dart';
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
        .read(machineListProvider.notifier)
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
            _buildTimeSlotTile(0, machine.isReservations[0]),
            _buildTimeSlotTile(1, machine.isReservations[1]),
            _buildTimeSlotTile(2, machine.isReservations[2]),
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

  Widget _buildTimeSlotTile(int timeIndex, bool isReserved) {
    final startTime = _calculateStartTime(timeIndex);

    return ListTile(
      title: Row(
        children: [
          Text(startTime),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: isReserved ? null : () => _handleReservation(timeIndex),
        // Adjust for 0-based index
        child: Text(isReserved ? '예약 불가' : '예약하기'),
      ),
    );
  }



  String _calculateStartTime(int timeIndex) {

    final timeOfHours = DateTime.now().hour;

    // 하드코딩된 종료 시간을 반환합니다.
    switch (timeIndex) {
      case 0:
        return '$timeOfHours:00 - ${timeOfHours}:10';
      case 1:
        return '$timeOfHours:20 - ${timeOfHours}:30';
      case 2:
        return '$timeOfHours:40 - ${timeOfHours}:50';
      default:
        {
          throw Exception('Invalid time index');
        }
    }
  }





  void _handleReservation(int timeIndex) {
    print('$timeIndex');
    // Implement reservation logic here
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
