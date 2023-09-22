import 'package:equatable/equatable.dart';
import 'package:lotura/data/dto/response/apply_response.dart';

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
  final List<ApplyResponse> applyList;

  Loaded({
    required this.applyList,
  });

  @override
  List<Object> get props => [applyList];
}
