import 'package:equatable/equatable.dart';

abstract class LaundryEvent extends Equatable {}

class GetLaundryEvent extends LaundryEvent {
  @override
  List<Object?> get props => [];
}
