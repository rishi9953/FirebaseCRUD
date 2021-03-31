import 'package:flutter/material.dart';
import 'package:newproject/databaseservice.dart';
import 'package:newproject/dashboard.dart';

Map<String, dynamic> model = new Map<String, dynamic>();

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String name;
  String phone;
  String age;
  String time;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My First App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name", hintText: "Enter the Name"),
                    onSaved: (value) {
                      setState(
                        () {
                          name = value;
                          model['name'] = value;
                        },
                      );
                    },
                    validator: (name) {
                      return name.isEmpty ? 'plaese Enter your name' : null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter the Phone Number"),
                    onSaved: (value) {
                      setState(
                        () {
                          phone = value;
                          model['phone'] = value;
                        },
                      );
                    },
                    validator: (phone) {
                      return phone.isEmpty ? 'plaese Enter phone number' : null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  DataBaseServices().addUser(model);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('User Added'),
                  ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashborad(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error'),
                    ),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
