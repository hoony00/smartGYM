import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/machine_images.dart';

import 'images_repository.dart';

///* 공지사항을 관리하는 provider 0207 이상훈

final machineImagesProvider =
    StateNotifierProvider<MachineStateNotifier, List<MachineModel>>(
  (ref) =>
      MachineStateNotifier([], ref, ref.read(machineRepository)),
);

class MachineStateNotifier extends StateNotifier<List<MachineModel>> {
  final Ref _ref;
  final MachineRepository repository;

  MachineStateNotifier(super.state, this._ref, this.repository);

  Future getNotice() async {
    try {
      List<MachineModel> machineList = await repository.getMachine();
      state = machineList;
    } catch (e) {
      print("NoticeStateNotifier [getNotice] 에러: $e");
    }
  }
}
