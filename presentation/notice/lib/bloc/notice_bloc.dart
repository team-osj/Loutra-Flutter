import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notice_domain/entity/notice_entity.dart';
import 'package:notice_domain/use_case/get_last_notice_id_use_case.dart';
import 'package:notice_domain/use_case/get_notice_use_case.dart';
import 'package:notice_domain/use_case/update_last_notice_id_use_case.dart';
import 'package:notice_presentation/bloc/notice_event.dart';
import 'package:notice_presentation/bloc/notice_model.dart';
import 'package:notice_presentation/bloc/notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState<NoticeModel>> {
  final GetNoticeUseCase _getNoticeUseCase;
  final GetLastNoticeIdUseCase _getLastNoticeIdUseCase;
  final UpdateLastNoticeIdUseCase _updateLastNoticeIdUseCase;

  NoticeBloc(
      {required GetNoticeUseCase getNoticeUseCase,
      required GetLastNoticeIdUseCase getLastNoticeIdUseCase,
      required UpdateLastNoticeIdUseCase updateLastNoticeIdUseCase})
      : _getNoticeUseCase = getNoticeUseCase,
        _getLastNoticeIdUseCase = getLastNoticeIdUseCase,
        _updateLastNoticeIdUseCase = updateLastNoticeIdUseCase,
        super(Empty(
            data: const NoticeModel(
          noticeList: <NoticeEntity>[],
          isNewNotice: false,
        ))) {
    on<GetNoticeEvent>(_getNoticeEventHandler);
    on<UpdateLastNoticeIdEvent>(_updateLastNoticeIdEventHandler);
  }

  void _getNoticeEventHandler(
      GetNoticeEvent event, Emitter<NoticeState<NoticeModel>> emit) async {
    try {
      emit(Loading());
      final noticeList = await _getNoticeUseCase.execute();
      final isNewNotice =
          _getLastNoticeIdUseCase.execute(noticeList: noticeList);
      final newNoticeModel =
          NoticeModel(noticeList: noticeList, isNewNotice: isNewNotice);
      emit(Loaded(data: newNoticeModel));
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _updateLastNoticeIdEventHandler(UpdateLastNoticeIdEvent event,
      Emitter<NoticeState<NoticeModel>> emit) async {
    try {
      await _updateLastNoticeIdUseCase.execute(
          noticeList: state.value.noticeList);
      emit(Loaded(data: state.value.copyWith(isNewNotice: false)));
    } catch (e) {
      emit(Error(error: e));
    }
  }
}
