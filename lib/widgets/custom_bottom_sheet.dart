import 'package:flutter/material.dart';
import 'package:okthoub/model/status_enum.dart';
import 'package:okthoub/provider/auth_provider.dart';
import 'package:okthoub/screens/auth_page.dart';
import 'package:okthoub/screens/home_page.dart';
import 'package:okthoub/widgets/main_button.dart';
import 'package:provider/provider.dart';

class CustomButtomSheet extends StatefulWidget {
  @override
  _CustomButtomSheetState createState() => _CustomButtomSheetState();
}

class _CustomButtomSheetState extends State<CustomButtomSheet> {
  List<String> qualifications = <String>[
    "PhD",
    "Master",
    "Bachelor",
    "Above Average",
    "Under Average"
  ];
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedQualf;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems();
    _selectedQualf = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String qual in qualifications) {
      items.add(
        DropdownMenuItem(
          value: qual,
          child: Text(qual),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(String selectedVideo) {
    setState(() {
      _selectedQualf = selectedVideo;
    });
  }

  int _selectedValue = 1;

  onRadioTapped(int value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AuthProvider>(
        builder: (context, model, child) {
          if (model.locationStatus == Status.Idle) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _selectedValue,
                        onChanged: onRadioTapped,
                      ),
                      Text(
                        "Qualification",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  (_selectedValue == 1)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              value: _selectedQualf,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                              icon: Icon(Icons.arrow_downward_rounded),
                              elevation: 5,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            MainButton(
                                buttonText: "Continue",
                                onPressed: settingQualifications),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _selectedValue,
                        onChanged: onRadioTapped,
                      ),
                      Text(
                        "Location",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      _selectedValue == 2
                          ? IconButton(
                              icon: Icon(Icons.my_location_rounded),
                              onPressed: () => gettingLocation(context),
                              color: Theme.of(context).accentColor,
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            );
          } else if (model.locationStatus == Status.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void settingQualifications() {
    Provider.of<AuthProvider>(context, listen: false)
        .setUserQualfication(_selectedQualf);
    exitingNavigatePage();
  }

  void gettingLocation(context) async {
    Provider.of<AuthProvider>(context, listen: false)
        .getUserLocation()
        .then((value) {
      if (value) {
        exitingNavigatePage();
      }
    });
  }

  void exitingNavigatePage() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }
}
