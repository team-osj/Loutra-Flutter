import 'package:equatable/equatable.dart';
import 'package:lotura/domain/model/osj_list.dart';

abstract class OSJState extends Equatable {}

class Empty extends OSJState {
  @override
  List<Object> get props => [];
}

class Loading extends OSJState {
  @override
  List<Object> get props => [];
}

class Error extends OSJState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class Loaded extends OSJState {
  final OsjList osjList;

  Loaded({
    required this.osjList,
  });

  @override
  List<Object> get props => [osjList];
}
