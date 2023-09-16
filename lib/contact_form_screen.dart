import 'package:contactform/bloc/contact_bloc.dart';
import 'package:contactform/bloc/contact_event.dart';
import 'package:contactform/bloc/contact_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addresController = TextEditingController();

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNoController = TextEditingController();
    addresController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('ContactData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Form"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      height: 650,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                // CircleAvatar(
                                //   radius: 50,
                                //   backgroundImage:
                                //       AssetImage('images/twentyfour.png'),
                                //   // backgroundColor: Color.fromARGB(255, 99, 237, 19),
                                //   // backgroundImage: NetworkImage()
                                // ),
                                // SizedBox(
                                //   height: 20.0,
                                // ),
                                // CircleAvatar(
                                //   radius: 70,
                                //   backgroundImage:
                                //       AssetImage('images/twentyfour.png'),
                                // ),
                                //Image.asset(name)

                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 83,
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        AssetImage('assets/two.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                BlocBuilder<ContactBloc, ContactState>(
                                  builder: (context, state) {
                                    if (state is ContactErrorState) {
                                      return Center(
                                        child: Text(
                                          state.errorMessage,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: nameController,
                                  onChanged: (val) {
                                    BlocProvider.of<ContactBloc>(context).add(
                                        ContactTextChangedEvent(
                                            nameController.text,
                                            emailController.text,
                                            phoneNoController.text,
                                            addresController.text));
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: "Enter your Name",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .blue, // You can customize the border color
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextField(
                                  controller: emailController,
                                  onChanged: (val) {
                                    BlocProvider.of<ContactBloc>(context).add(
                                        ContactTextChangedEvent(
                                            nameController.text,
                                            emailController.text,
                                            phoneNoController.text,
                                            addresController.text));
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.email),
                                    hintText: "Enter your Email",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .blue, // You can customize the border color
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: phoneNoController,
                                  onChanged: (val) {
                                    BlocProvider.of<ContactBloc>(context).add(
                                        ContactTextChangedEvent(
                                            nameController.text,
                                            emailController.text,
                                            phoneNoController.text,
                                            addresController.text));
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.phone_android),
                                    hintText: "Enter your Phone Number",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .blue, // You can customize the border color
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: addresController,
                                  onChanged: (val) {
                                    BlocProvider.of<ContactBloc>(context).add(
                                        ContactTextChangedEvent(
                                            nameController.text,
                                            emailController.text,
                                            phoneNoController.text,
                                            addresController.text));
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.pin_drop),
                                    hintText: "Enter your Address",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .blue, // You can customize the border color
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                BlocBuilder<ContactBloc, ContactState>(
                                  builder: (context, state) {
                                    if (state is ContactLoadingState) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    return CupertinoButton(
                                      color: (state is ContactValidState)
                                          ? Colors.blue
                                          : Colors.grey,
                                      child: Text(
                                        "Submit",
                                      ),
                                      // onPressed: () {
                                      //   if (state is ContactValidState) {
                                      //     BlocProvider.of<ContactBloc>(context).add(
                                      //       ContactTextChangedEvent(
                                      //           nameController.text,
                                      //           emailController.text,
                                      //           phoneNoController.text,
                                      //           addresController.text),
                                      //     );
                                      //   }

                                      // },

                                      onPressed: () async {
                                        String name = nameController.text;
                                        String phone = phoneNoController.text;
                                        String address = addresController.text;
                                        String email = emailController.text;

                                        Map<String, String> data = {
                                          'name': name,
                                          'email': email,
                                          'address': address,
                                          'phone': phone,
                                        };
                                        _ref.push().set(data).then((value) {
                                          Navigator.pop(context);
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.green,
                                            duration: Duration(
                                                seconds: 1, milliseconds: 500),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            content: Text(
                                                "Your Data Uploaded Successfully"),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
