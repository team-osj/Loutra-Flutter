import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/entity/notice_entity.dart';
import 'package:lotura/domain/use_case/get_notice_use_case.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_event.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState<List<NoticeEntity>>> {
  final GetNoticeUseCase _getNoticeUseCase;

  NoticeBloc({required GetNoticeUseCase getNoticeUseCase})
      : _getNoticeUseCase = getNoticeUseCase,
        super(Empty()) {
    on<GetNoticeEvent>(_getNoticeEventHandler);
  }

  void _getNoticeEventHandler(GetNoticeEvent event,
      Emitter<NoticeState<List<NoticeEntity>>> emit) async {
    try {
      emit(Loading());
      final noticeList = await _getNoticeUseCase.execute();
      emit(Loaded(data: noticeList));
    } catch (e) {
      emit(Error(error: e));
    }
  }
}
