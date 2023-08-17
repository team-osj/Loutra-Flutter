import 'package:equatable/equatable.dart';
import 'package:lotura/domain/model/osj_list.dart';

abstract class LaundryState extends Equatable {}

class Empty extends LaundryState {
  @override
  List<Object> get props => [];
}

class Loading extends LaundryState {
  @override
  List<Object> get props => [];
}

class Error extends LaundryState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class Loaded extends LaundryState {
  final OsjList osjList;

  Loaded({
    required this.osjList,
  });

  @override
  List<Object> get props => [osjList];
}
