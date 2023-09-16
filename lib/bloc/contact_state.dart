abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactValidState extends ContactState {}

class ContactErrorState extends ContactState {
  final String errorMessage;
  ContactErrorState(this.errorMessage);
}

class ContactLoadingState extends ContactState {}
