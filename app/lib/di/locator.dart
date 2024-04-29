import 'dart:async';

import 'package:apply_data/data_source/remote/remote_apply_data_source.dart';
import 'package:apply_data/repository/apply_repository.dart';
import 'package:apply_data/repository/apply_repository_impl.dart';
import 'package:apply_domain/use_case/apply_cancel_use_case.dart';
import 'package:apply_domain/use_case/get_apply_list_use_case.dart';
import 'package:apply_domain/use_case/send_fcm_info_use_case.dart';
import 'package:apply_presentation/bloc/apply_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laundry_data/data_source/local/local_laundry_data_source.dart';
import 'package:laundry_data/data_source/remote/remote_laundry_data_source.dart';
import 'package:laundry_data/dto/response/laundry_response.dart';
import 'package:laundry_data/repository/laundry_repository.dart';
import 'package:laundry_data/repository/laundry_repository_impl.dart';
import 'package:laundry_domain/use_case/get_all_laundry_list_use_case.dart';
import 'package:laundry_domain/use_case/get_laundry_room_index_use_case.dart';
import 'package:laundry_domain/use_case/get_laundry_status_use_case.dart';
import 'package:laundry_domain/use_case/update_laundry_room_index_use_case.dart';
import 'package:laundry_room_presentation/bloc/laundry_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  //stream controller
  locator.registerSingleton<StreamController<LaundryResponse>>(
      StreamController<LaundryResponse>());

  //local database
  // await Hive.initFlutter();
  // final box = await Hive.openBox<int>("Lotura");
  // locator.registerSingleton<Box<int>>(box);
  await Hive.initFlutter();
  final box = await Hive.openBox<int>("Lotura");
  locator.registerSingleton<Box<int>>(box);

  //data_source
  locator.registerSingleton<RemoteApplyDataSource>(RemoteApplyDataSource());

  locator.registerSingleton<RemoteLaundryDataSource>(RemoteLaundryDataSource(
      streamController: locator<StreamController<LaundryResponse>>()));

  locator.registerSingleton<LocalLaundryDataSource>(
      LocalLaundryDataSource(localDatabase: locator<Box<int>>()));

  //repository
  locator.registerSingleton<ApplyRepository>(ApplyRepositoryImpl(
      remoteApplyDataSource: locator<RemoteApplyDataSource>()));

  locator.registerSingleton<LaundryRepository>(LaundryRepositoryImpl(
      localLaundryDataSource: locator<LocalLaundryDataSource>(),
      remoteLaundryDataSource: locator<RemoteLaundryDataSource>()));

  //use_case
  locator.registerSingleton<ApplyCancelUseCase>(
      ApplyCancelUseCase(applyRepository: locator<ApplyRepository>()));
  locator.registerSingleton<GetApplyListUseCase>(
      GetApplyListUseCase(applyRepository: locator<ApplyRepository>()));
  locator.registerSingleton<SendFCMInfoUseCase>(
      SendFCMInfoUseCase(applyRepository: locator<ApplyRepository>()));

  locator.registerSingleton<GetAllLaundryListUseCase>(GetAllLaundryListUseCase(
      laundryRepository: locator<LaundryRepository>()));
  locator.registerSingleton<GetLaundryRoomIndexUseCase>(
      GetLaundryRoomIndexUseCase(
          laundryRepository: locator<LaundryRepository>()));
  locator.registerSingleton<GetLaundryStatusUseCase>(
      GetLaundryStatusUseCase(laundryRepository: locator<LaundryRepository>()));
  locator.registerSingleton<UpdateLaundryRoomIndexUseCase>(
      UpdateLaundryRoomIndexUseCase(
          laundryRepository: locator<LaundryRepository>()));

  //bloc
  locator.registerFactory<ApplyBloc>(() => ApplyBloc(
        getApplyListUseCase: locator<GetApplyListUseCase>(),
        sendFCMInfoUseCase: locator<SendFCMInfoUseCase>(),
        applyCancelUseCase: locator<ApplyCancelUseCase>(),
      ));

  locator.registerFactory<LaundryBloc>(() => LaundryBloc(
        getLaundryStatusUseCase: locator<GetLaundryStatusUseCase>(),
        getAllLaundryListUseCase: locator<GetAllLaundryListUseCase>(),
      ));
}