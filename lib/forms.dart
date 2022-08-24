import 'package:flutter/material.dart';
import 'package:forms_validations/submit.dart';

class Formsss extends StatefulWidget {
  const Formsss({Key? key}) : super(key: key);

  @override
  State<Formsss> createState() => _FormsssState();
}

class _FormsssState extends State<Formsss> {
  final _formKey = GlobalKey<FormState>();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms And Validation"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username Required";
                          } else if (value.length < 5) {
                            return "Username Must Be Atleast 5 Characters Long";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Enter Username Here",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        obscureText: true,
                        maxLength: 8,
                        controller: _passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password Required";
                          } else if (value.length < 8) {
                            return "Password Must Be Atleast 8 Characters Long";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password Here",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        obscureText: true,
                        maxLength: 8,
                        controller: _confirmpasswordcontroller,
                        validator: (value) {
                          if (value != _passwordcontroller.value.text) {
                            return "Passwords Do Not Match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Confirm Password Here",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 25),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Success()));
                        },
                        child: const Text("Submit Form")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
