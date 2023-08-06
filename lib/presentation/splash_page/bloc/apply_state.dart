import 'package:equatable/equatable.dart';
import 'package:lotura/domain/model/apply_response_list.dart';

abstract class ApplyState extends Equatable {}

class Empty extends ApplyState {
  @override
  List<Object> get props => [];
}

class Loading extends ApplyState {
  @override
  List<Object> get props => [];
}

class Error extends ApplyState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class Loaded extends ApplyState {
  final ApplyResponseList applyList;

  Loaded({
    required this.applyList,
  });

  @override
  List<Object> get props => [applyList];
}
