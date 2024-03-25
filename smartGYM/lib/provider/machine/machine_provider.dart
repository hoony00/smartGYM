import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/m_machine.dart';

import 'machine_repository.dart';

///* 공지사항을 관리하는 provider 0207 이상훈

final machineListProvider =
StateNotifierProvider<MachineStateNotifier, List<MachineModel>>(
      (ref) => MachineStateNotifier(ref, repository: ref.read(machineRepository)),
);

class MachineStateNotifier extends StateNotifier<List<MachineModel>> {
  final Ref _ref;
  final MachineRepository repository;

  MachineStateNotifier(this._ref, {required this.repository}) : super([]);

  Future<List<MachineModel>> getMachine() async {
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
}
