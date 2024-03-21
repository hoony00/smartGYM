import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/machine_images.dart';



final machineRepository = Provider((ref) => MachineRepository(ref));

class MachineRepository {
  final Ref _ref;
  final imagesUrl = <String>['armCurl.jpg', 'lateralRaise.jpg', 'pecFly.jpd',
    'pullDownExercise.jpg', 'pullUpMachine.jpg', 'seatedRow.jpd',
    'shoulderPress.jpg', 'smithMachine.jpg'];

  final machineName = <String>['armCurl', 'lateralRaise', 'pecFly',
    'pullDownExercise', 'pullUpMachine', 'seatedRow',
    'shoulderPress', 'smithMachine'];

  final machineDescription = <String>['팔굽혀펴기', '옆팔 올리기', '가슴 날개 펴기',
    '풀다운', '풀업머신', '앉아서 당기기',
    '어깨 누르기', '스미스머신'];

  final machineType = <String>['upper', 'upper', 'upper','upper', 'upper', 'upper', 'upper', 'upper'];


  MachineRepository(this._ref);

  Future<List<MachineModel>> getMachine() async {
    // assets에 있는 이미지를 가져오는 부분
    List<MachineModel> machineImages = [];

    for (int i = 0; i < imagesUrl.length; i++) {
      machineImages.add(MachineModel(
          machineImage: Image.asset('assets/images/machine/${imagesUrl[i]}'),
          machineName: machineName[i],
          machineDescription: machineDescription[i],
          machineType: machineType[i])
      );
    }

    return machineImages;


  }
}
