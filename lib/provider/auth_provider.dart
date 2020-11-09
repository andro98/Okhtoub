import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:okthoub/model/status_enum.dart';
import 'package:okthoub/model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel userModel = UserModel(userName: "Andrew", phoneNumber: "0120");
  String smsCode;
  Status locationStatus = Status.Idle;
  Status codeStatus = Status.Idle;

  void createUserModel(String userName, String phoneNumber) {
    userModel = UserModel(phoneNumber: phoneNumber, userName: userName);
  }

  void setUserQualfication(String val) {
    locationStatus = Status.Loading;
    notifyListeners();
    userModel.qualifications = val;
    locationStatus = Status.Success;
    notifyListeners();
  }

  Future<bool> getUserLocation() async {
    locationStatus = Status.Loading;
    notifyListeners();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      userModel.location =
          UserLocation(long: position.longitude, lat: position.latitude);

      locationStatus = Status.Success;
      notifyListeners();
      return true;
    } catch (e) {
      locationStatus = Status.Error;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithPhone() async {
    try {
      print("Signing");
      codeStatus = Status.Loading;
      notifyListeners();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+201203223460',
        timeout: Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential credential) {
          smsCode = credential.smsCode;
          print(credential.smsCode);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          print("Code Sent");
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } catch (e) {
      return false;
    }
  }
  
  void test(){
    PhoneAuthProvider.getCredential(smsCode: "123456");
  }
}
