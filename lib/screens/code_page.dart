import 'package:flutter/material.dart';
import 'package:okthoub/screens/continue_data.dart';
import 'package:okthoub/widgets/custom_text_field.dart';
import 'package:okthoub/widgets/main_button.dart';

class CodePage extends StatefulWidget {
  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Enter your code"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          margin: EdgeInsets.only(top: size.height * .10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: "Code",
                  inputType: TextInputType.number,
                  onSaved: (String value) {},
                  onValidate: (String value) {
                    if (value.isEmpty) {
                      return 'Code cannot be empty';
                    }
                    return null;
                  },
                ),
                MainButton(
                  buttonText: "Sign Up",
                  onPressed: () => _onContinueTapped(context),
                ),
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
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => ContinueDataPage()));
    }
  }
}
