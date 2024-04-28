import 'package:apply_data/data_source/remote/remote_apply_data_source.dart';
import 'package:apply_data/repository/apply_repository.dart';
import 'package:apply_data/repository/apply_repository_impl.dart';
import 'package:apply_domain/use_case/apply_cancel_use_case.dart';
import 'package:apply_domain/use_case/get_apply_list_use_case.dart';
import 'package:apply_domain/use_case/send_fcm_info_use_case.dart';
import 'package:apply_presentation/bloc/apply_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initLocator() {
  //data_source
  locator.registerSingleton<RemoteApplyDataSource>(RemoteApplyDataSource());

  //repository
  locator.registerSingleton<ApplyRepository>(ApplyRepositoryImpl(
      remoteApplyDataSource: locator<RemoteApplyDataSource>()));

  //use_case
  locator.registerSingleton<ApplyCancelUseCase>(
      ApplyCancelUseCase(applyRepository: locator<ApplyRepository>()));
  locator.registerSingleton<GetApplyListUseCase>(
      GetApplyListUseCase(applyRepository: locator<ApplyRepository>()));
  locator.registerSingleton<SendFCMInfoUseCase>(
      SendFCMInfoUseCase(applyRepository: locator<ApplyRepository>()));

  //bloc
  locator.registerSingleton<ApplyBloc>(ApplyBloc(
    getApplyListUseCase: locator<GetApplyListUseCase>(),
    sendFCMInfoUseCase: locator<SendFCMInfoUseCase>(),
    applyCancelUseCase: locator<ApplyCancelUseCase>(),
  ));
}
