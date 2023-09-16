import 'package:contactform/bloc/contact_event.dart';
import 'package:contactform/bloc/contact_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitialState()) {
    on<ContactTextChangedEvent>((event, emit) => {
          if (event.nameValue.length < 4)
            {emit(ContactErrorState("Name should required atleast 4 alphabet"))}
          else if (EmailValidator.validate(event.emailValue) == false)
            {emit(ContactErrorState("Please enter a valid email address"))}
          else if (event.phoneNumberValue.length <= 9)
            {emit(ContactErrorState("Please enter a valid Phone Number"))}
          else if (event.AddressValue.length > 5)
            {emit(ContactErrorState("Please enter a valid Address"))}
          else
            {emit(ContactValidState())}
        });

    on<ContactSubmittedEvent>((event, emit) => {emit(ContactLoadingState())});
  }
}
