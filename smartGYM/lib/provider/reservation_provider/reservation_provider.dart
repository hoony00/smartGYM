import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/m_machine.dart';

import 'reservation_repository.dart';

///* 공지사항을 관리하는 provider 0207 이상훈

final reservationProvider =
StateNotifierProvider<ReservationStateNotifier, List<MachineModel>>(
      (ref) => ReservationStateNotifier(ref, repository: ref.read(machineRepository)),
);

class ReservationStateNotifier extends StateNotifier<List<MachineModel>> {
  final Ref _ref;
  final MachineRepository repository;

  ReservationStateNotifier(this._ref, {required this.repository}) : super([]);

  Future<List<MachineModel>> getReservation() async {
    try {
      List<MachineModel> machineList = await repository.getMachine();
      if(machineList.isNotEmpty){
        state = machineList;
      }
      return machineList;
    } catch (e) {
      print("MachineStateNotifier [getNotice] 에러: $e");
      return [];
    }
  }

  // 머신 이름으로 머신 정보 가져오기
  MachineModel getMachineByName(String name) {
    return state.firstWhere((machine) => machine.machineName == name);
  }

}
