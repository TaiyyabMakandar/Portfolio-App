abstract class ContactEvent {}

class ContactTextChangedEvent extends ContactEvent {
  final String nameValue;
  final String emailValue;
  final String phoneNumberValue;
  final String AddressValue;

  ContactTextChangedEvent(this.nameValue, this.emailValue,
      this.phoneNumberValue, this.AddressValue);
}

class ContactSubmittedEvent extends ContactEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  ContactSubmittedEvent(this.name, this.email, this.phoneNumber, this.address);
}
