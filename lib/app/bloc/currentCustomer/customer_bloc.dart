import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nivaas/app/repo/current_customer/customer_repository.dart';
import 'customer_event.dart';
import 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc({required this.customerRepository}) : super(CustomerInitial()) {
    on<FetchCustomerEvent>((event, emit) async {
      emit(CustomerLoading());
      try {
        final customer = await customerRepository.fetchCurrentCustomer();
        emit(CustomerLoaded(customer));
      } catch (e) {
        emit(CustomerError(e.toString()));
      }
    });
  }
}
