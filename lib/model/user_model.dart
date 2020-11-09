import 'package:meta/meta.dart';

class UserModel {
  final String userName;
  final String phoneNumber;
  String qualifications;
  UserLocation location;

  UserModel({
    @required this.userName,
    @required this.phoneNumber,
    this.qualifications,
    this.location,
  });
}

class UserLocation {
  final double long;
  final double lat;

  UserLocation({@required this.long, @required this.lat});
}
