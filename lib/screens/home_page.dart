import 'package:flutter/material.dart';
import 'package:okthoub/provider/auth_provider.dart';
import 'package:okthoub/widgets/sidebyside_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final userModel = Provider.of<AuthProvider>(context).userModel;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        margin: EdgeInsets.only(top: size.height * .10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideBySideText(fText: "Username: ", sText: userModel.userName),
            SideBySideText(
                fText: "Phone number: ", sText: userModel.phoneNumber),
            (userModel.location == null)
                ? SideBySideText(
                    fText: "Qualifications: ", sText: userModel.qualifications)
                : FittedBox(
                    fit: BoxFit.contain,
                    child: SideBySideText(
                        fText: "Location: ",
                        sText:
                            "Long: ${userModel.location.lat} , Lat:${userModel.location.long}"),
                  ),
          ],
        ),
      ),
    );
  }
}
