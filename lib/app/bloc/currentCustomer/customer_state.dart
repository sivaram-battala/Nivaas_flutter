import 'package:nivaas/app/models/currentCustomerModel.dart';

abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final CustomerModel customer;

  CustomerLoaded(this.customer);
}

class CustomerError extends CustomerState {
  final String error;

  CustomerError(this.error);
}
