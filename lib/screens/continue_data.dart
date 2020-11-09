import 'package:flutter/material.dart';
import 'package:okthoub/widgets/custom_bottom_sheet.dart';
import 'package:okthoub/widgets/main_button.dart';
import 'package:okthoub/widgets/sidebyside_text.dart';

class ContinueDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Continue your data"),
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
            SideBySideText(fText: "Username: ", sText: "Andrew"),
            SideBySideText(fText: "Phone number: ", sText: "0120"),
            Center(
              child: MainButton(
                buttonText: "استكمال البيانات",
                onPressed: () => _showMyButtomSheet(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMyButtomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomButtomSheet();
      },
    );
  }
}
