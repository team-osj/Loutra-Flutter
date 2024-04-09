import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lotura/data/data_source/apply/remote/remote_apply_data_source.dart';
import 'package:lotura/data/data_source/laundry/local/local_laundry_data_source.dart';
import 'package:lotura/data/data_source/laundry/remote/remote_laundry_data_source.dart';
import 'package:lotura/data/data_source/notice/local/local_notice_data_source.dart';
import 'package:lotura/data/data_source/notice/remote/remote_notice_data_source.dart';
import 'package:lotura/data/repository/apply_repository_impl.dart';
import 'package:lotura/data/repository/laundry_repository_impl.dart';
import 'package:lotura/data/repository/notice_repository_impl.dart';
import 'package:lotura/domain/entity/laundry_entity.dart';
import 'package:lotura/domain/repository/apply_repository.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';
import 'package:lotura/domain/repository/notice_repository.dart';
import 'package:lotura/domain/use_case/apply_cancel_use_case.dart';
import 'package:lotura/domain/use_case/get_all_laundry_list_use_case.dart';
import 'package:lotura/domain/use_case/get_apply_list_use_case.dart';
import 'package:lotura/domain/use_case/get_last_notice_id_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_room_index_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/domain/use_case/get_notice_use_case.dart';
import 'package:lotura/domain/use_case/send_fcm_info_use_case.dart';
import 'package:lotura/domain/use_case/update_last_notice_id_use_case.dart';
import 'package:lotura/domain/use_case/update_laundry_room_index_use_case.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';

Future<List<BlocProvider>> di() async {
  final box = await Hive.openBox<int>("Lotura");

  LocalLaundryDataSource localLaundryDataSource =
      LocalLaundryDataSource(localDatabase: box);

  LocalNoticeDataSource localNoticeDataSource = LocalNoticeDataSource(box: box);

  RemoteLaundryDataSource remoteLaundryDataSource = RemoteLaundryDataSource(
      streamController: StreamController<LaundryEntity>.broadcast());

  RemoteApplyDataSource remoteApplyDataSource = RemoteApplyDataSource();

  RemoteNoticeDataSource remoteNoticeDataSource = RemoteNoticeDataSource();

  LaundryRepository laundryRepository = LaundryRepositoryImpl(
      localLaundryDataSource: localLaundryDataSource,
      remoteLaundryDataSource: remoteLaundryDataSource);

  ApplyRepository applyRepository =
      ApplyRepositoryImpl(remoteApplyDataSource: remoteApplyDataSource);

  NoticeRepository noticeRepository = NoticeRepositoryImpl(
      remoteNoticeDataSource: remoteNoticeDataSource,
      localNoticeDataSource: localNoticeDataSource);

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

  GetAllLaundryListUseCase getAllLaundryListUseCase =
      GetAllLaundryListUseCase(laundryRepository: laundryRepository);

  UpdateLaundryRoomIndexUseCase updateLaundryRoomIndexUseCase =
      UpdateLaundryRoomIndexUseCase(laundryRepository: laundryRepository);

  GetNoticeUseCase getNoticeUseCase =
      GetNoticeUseCase(noticeRepository: noticeRepository);

  GetLastNoticeIdUseCase getLastNoticeIdUseCase =
      GetLastNoticeIdUseCase(noticeRepository: noticeRepository);

  UpdateLastNoticeIdUseCase updateLastNoticeIdUseCase =
      UpdateLastNoticeIdUseCase(noticeRepository: noticeRepository);

  return [
    BlocProvider<ApplyBloc>(
        create: (context) => ApplyBloc(
            getApplyListUseCase: getApplyListUseCase,
            applyCancelUseCase: applyCancelUseCase,
            sendFCMInfoUseCase: sendFCMInfoUseCase)),
    BlocProvider<LaundryBloc>(
        create: (context) => LaundryBloc(
            getLaundryStatusUseCase: getLaundryStatusUseCase,
            getAllLaundryListUseCase: getAllLaundryListUseCase)),
    BlocProvider<RoomBloc>(
      create: (context) => RoomBloc(
          getLaundryRoomIndexUseCase: getLaundryRoomIndexUseCase,
          updateLaundryRoomIndexUseCase: updateLaundryRoomIndexUseCase),
    ),
    BlocProvider<NoticeBloc>(
      create: (context) => NoticeBloc(
        getNoticeUseCase: getNoticeUseCase,
        getLastNoticeIdUseCase: getLastNoticeIdUseCase,
        updateLastNoticeIdUseCase: updateLastNoticeIdUseCase,
      ),
    ),
  ];
}
