import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  //Create a global key that uniquely identifies the form widget
//and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _email = TextEditingController();

    //Build a Form widget using the _formKey created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff87adff),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)),
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff87adff),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)),
              icon: const Icon(Icons.email),
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Color(0xffebf1ff)),
              labelText: 'Email',
            ),
          ),
          TextFormField(
            maxLength: 8,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff87adff),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)),
              icon: const Icon(Icons.email),
              hintText: 'Enter the Building No.',
              hintStyle: TextStyle(color: Color(0xffebf1ff)),
              labelText: 'Building no.',
            ),
          ),
        ],
      ),
    );
  }
}
