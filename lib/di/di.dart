import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/data/repository/apply_repository_impl.dart';
import 'package:lotura/data/repository/laundry_repository_impl.dart';
import 'package:lotura/domain/repository/apply_repository.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';
import 'package:lotura/domain/use_case/apply_cancel_use_case.dart';
import 'package:lotura/domain/use_case/get_apply_list_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/domain/use_case/send_fcm_info_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/main_page/bloc/apply_bloc.dart';

List<BlocProvider> di() {
  ApplyRepository applyRepository =
      ApplyRepositoryImpl(StreamController<List<ApplyResponse>>.broadcast());

  LaundryRepository laundryRepository = LaundryRepositoryImpl(
      StreamController<List<LaundryResponse>>.broadcast());

  GetLaundryStatusUseCase getLaundryStatusUseCase =
      GetLaundryStatusUseCase(laundryRepository: laundryRepository);

  GetApplyListUseCase getApplyListUseCase =
      GetApplyListUseCase(applyRepository: applyRepository);

  SendFCMInfoUseCase sendFCMInfoUseCase =
      SendFCMInfoUseCase(applyRepository: applyRepository);

  ApplyCancelUseCase applyCancelUseCase =
      ApplyCancelUseCase(applyRepository: applyRepository);
  return [
    BlocProvider<ApplyBloc>(
        create: (context) => ApplyBloc(
            getApplyListUseCase: getApplyListUseCase,
            applyCancelUseCase: applyCancelUseCase,
            sendFCMInfoUseCase: sendFCMInfoUseCase)),
    BlocProvider<LaundryBloc>(
        create: (context) =>
            LaundryBloc(getLaundryStatusUseCase: getLaundryStatusUseCase)),
  ];
}
