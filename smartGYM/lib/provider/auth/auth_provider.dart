


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/m_auth.dart';

final authProvider = StateProvider<AuthModel>((ref)=> AuthModel(uid: 'admin1234'));

