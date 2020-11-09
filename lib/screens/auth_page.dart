import 'package:flutter/material.dart';
import 'package:okthoub/provider/auth_provider.dart';
import 'package:okthoub/screens/code_page.dart';
import 'package:okthoub/widgets/custom_text_field.dart';
import 'package:okthoub/widgets/main_button.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String phone;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffd3d3d3),
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: "Username",
                  inputType: TextInputType.text,
                  onSaved: (value) {
                    username = value;
                  },
                  onValidate: (String value) {
                    if (value.isEmpty) {
                      return 'Username cannot be empty';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Phone Number",
                  inputType: TextInputType.number,
                  onSaved: (value) {
                    phone = value;
                  },
                  onValidate: (String value) {
                    if (value.isEmpty) {
                      return 'Phone number cannot be empty';
                    }
                    return null;
                  },
                ),
               MainButton(buttonText: "Continue", onPressed: () => _onContinueTapped(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onContinueTapped(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<AuthProvider>(context, listen: false).createUserModel(username, phone);
      // Provider.of<AuthProvider>(context, listen: false).signInWithPhone().then((value) {
      //   if(value){}
      // });
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => CodePage()));
    }
  }
}
