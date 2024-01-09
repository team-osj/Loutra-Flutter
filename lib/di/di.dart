import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lotura/data/data_source/apply/remote/remote_apply_data_source.dart';
import 'package:lotura/data/data_source/laundry/local/local_laundry_data_source.dart';
import 'package:lotura/data/data_source/laundry/remote/remote_laundry_data_source.dart';
import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/data/repository/apply_repository_impl.dart';
import 'package:lotura/data/repository/laundry_repository_impl.dart';
import 'package:lotura/domain/repository/apply_repository.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';
import 'package:lotura/domain/use_case/apply_cancel_use_case.dart';
import 'package:lotura/domain/use_case/get_apply_list_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_room_index_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/domain/use_case/send_fcm_info_use_case.dart';
import 'package:lotura/domain/use_case/update_laundry_room_index_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/main_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/secret.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

Future<List<BlocProvider>> di() async {
  IO.Socket socket = IO.io(
      '$baseurl/application',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .build());

  final box = await Hive.openBox<int>("Lotura");

  LocalLaundryDataSource localLaundryDataSource =
      LocalLaundryDataSource(localDatabase: box);

  RemoteLaundryDataSource remoteLaundryDataSource = RemoteLaundryDataSource(
      streamController: StreamController<List<LaundryResponse>>.broadcast(),
      socket: socket);

  RemoteApplyDataSource remoteApplyDataSource = RemoteApplyDataSource(
      streamController: StreamController<List<ApplyResponse>>.broadcast(),
      socket: socket);

  LaundryRepository laundryRepository = LaundryRepositoryImpl(
      localLaundryDataSource: localLaundryDataSource,
      remoteLaundryDataSource: remoteLaundryDataSource);

  ApplyRepository applyRepository =
      ApplyRepositoryImpl(remoteApplyDataSource: remoteApplyDataSource);

  GetLaundryStatusUseCase getLaundryStatusUseCase =
      GetLaundryStatusUseCase(laundryRepository: laundryRepository);

  GetApplyListUseCase getApplyListUseCase =
      GetApplyListUseCase(applyRepository: applyRepository);

  SendFCMInfoUseCase sendFCMInfoUseCase =
      SendFCMInfoUseCase(applyRepository: applyRepository);

  ApplyCancelUseCase applyCancelUseCase =
      ApplyCancelUseCase(applyRepository: applyRepository);

  GetLaundryRoomIndexUseCase getLaundryRoomIndexUseCase =
      GetLaundryRoomIndexUseCase(laundryRepository: laundryRepository);

  UpdateLaundryRoomIndexUseCase updateLaundryRoomIndexUseCase =
      UpdateLaundryRoomIndexUseCase(laundryRepository: laundryRepository);

  return [
    BlocProvider<ApplyBloc>(
        create: (context) => ApplyBloc(
            getApplyListUseCase: getApplyListUseCase,
            applyCancelUseCase: applyCancelUseCase,
            sendFCMInfoUseCase: sendFCMInfoUseCase)),
    BlocProvider<LaundryBloc>(
        create: (context) =>
            LaundryBloc(getLaundryStatusUseCase: getLaundryStatusUseCase)),
    BlocProvider<RoomBloc>(
      create: (context) => RoomBloc(
          getLaundryRoomIndexUseCase: getLaundryRoomIndexUseCase,
          updateLaundryRoomIndexUseCase: updateLaundryRoomIndexUseCase),
    ),
  ];
}
