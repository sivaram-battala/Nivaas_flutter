import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String phoneNumber;

  LoginButtonPressed({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
