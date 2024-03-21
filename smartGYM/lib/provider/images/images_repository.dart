import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/machine_images.dart';

final machineRepository = Provider((ref) => MachineRepository(ref));

class MachineRepository {
  final Ref _ref;
  final imagesUrl = <String>[
    //1
    'armCurl.jpg',
    //2
    'lateralRaise.jpg',
    //3
    'pecFly.jpg',
    //4
    'pullDownExercise.jpg',
    //5
    'pullUpMachine.jpg',
    //6
    'seatedRow.jpg',
    //7
    'shoulderPress.jpg',
    //8
    'smithMachine.jpg'

  ];

  final machineName = <String>[
    //1
    'armCurl',
    //2
    'lateralRaise',
    //3
    'pecFly',
    //4
    'pullDownExercise',
    //5
    'pullUpMachine',
    //6
    'seatedRow',
    //7
    'shoulderPress',
    //8
    'smithMachine'
  ];

  final machineDescription = <String>[
    //1
    '벤치에 앉아서 덤벨을 손에 쥐고, 손바닥이 위를 향하도록 합니다. 팔꿈치를 고정하고, 손목을 돌려 덤벨을 어깨까지 들어 올립니다.천천히 덤벨을 원래 위치로 내립니다.',
    //2
    '서서 덤벨을 손에 쥐고, 팔을 옆으로 내립니다. 손바닥이 바닥을 향하도록 하고, 팔꿈치를 살짝 구부린 상태에서 덤벨을 어깨 높이까지 들어 올립니다. 천천히 덤벨을 원래 위치로 내립니다.',
    //3
    '덤벨을 손에 쥐고 벤치에 누워 줍니다. 팔꿈치를 살짝 구부린 상태에서 덤벨을 가슴 위로 들어 올립니다. 천천히 덤벨을 원래 위치로 내립니다.',
    //4
    '풀다운 머신에 앉아서 핸들을 잡습니다. 핸들을 잡아당겨 턱까지 들어 올립니다. 천천히 핸들을 원래 위치로 내립니다.',
    //5
    '풀업 머신에 앉아서 핸들을 잡습니다. 핸들을 잡아당겨 몸을 들어 올립니다. 천천히 몸을 내립니다.',
    //6
    '시티드 로우 머신에 앉아서 핸들을 잡습니다. 핸들을 잡아당겨 가슴까지 들어 올립니다. 천천히 핸들을 원래 위치로 내립니다.',
    //7
    '벤치에 앉아서 덤벨을 손에 쥐고, 어깨 높이까지 들어 올립니다. 팔꿈치를 살짝 구부린 상태에서 덤벨을 머리 위로 들어 올립니다. 천천히 덤벨을 원래 위치로 내립니다.',
    //8
    '스미스 머신 바를 어깨에 얹고, 스쿼트, 데드리프트, 벤치 프레스 등 다양한 운동을 할 수 있습니다.'
  ];

  // 운동 부위
  final machineType = <String>[
    //1
    '상완 이두근',
    //2
    '삼각근',
    //3
    '가슴',
    //4
    '광배근',
    //5
    '광배근',
    //6
    '광배근',
    //7
    '삼각근',
    //8
    'All'
  ];

  // 예약 상태
  final reservation = <bool>[
   //1
    false,
   //2
    false,
   //3
    false,
   //4
    false,
   //5
    false,
   //6
    false,
   //7
    false,
   //8
    false
  ];

  MachineRepository(this._ref);

  Future<List<MachineModel>> getMachine() async {
    // assets에 있는 이미지를 가져오는 부분
    List<MachineModel> machineImages = [];

    for (int i = 0; i < imagesUrl.length; i++) {
      machineImages.add(MachineModel(
          machineImageUrl: imagesUrl[i],
          machineName: machineName[i],
          machineDescription: machineDescription[i],
          machineType: machineType[i],
          isReservations: reservation[i]));


    }

    return machineImages;
  }
}
