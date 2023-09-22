import 'package:equatable/equatable.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';

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
  final List<LaundryResponse> laundryResponseList;

  Loaded({
    required this.laundryResponseList,
  });

  @override
  List<Object> get props => [laundryResponseList];
}
