import 'package:equatable/equatable.dart';

abstract class ApplyEvent extends Equatable {}

class GetApplyListEvent extends ApplyEvent {
  @override
  List<Object?> get props => [];
}

class ApplyCancelEvent extends ApplyEvent {
  @override
  List<Object?> get props => [];
}
