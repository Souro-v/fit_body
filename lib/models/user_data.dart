
import 'package:flutter/material.dart';
import 'dart:io';

class UserData extends ChangeNotifier {
  static final UserData _instance = UserData._internal();
  factory UserData() => _instance;
  UserData._internal();

  // Profile info
  String name      = 'Madison Smith';
  String nickname  = 'Madison';
  String email     = 'madisons@example.com';
  String mobile    = '+123 567 89000';
  String birthday  = '01 / 04 / 199X';
  String weight    = '75 Kg';
  String height    = '1.65 CM';
  int age          = 28;
  File? profilePhoto;

  void update({
    String? name,
    String? nickname,
    String? email,
    String? mobile,
    String? birthday,
    String? weight,
    String? height,
    File? profilePhoto,
  }) {
    if (name != null)         this.name = name;
    if (nickname != null)     this.nickname = nickname;
    if (email != null)        this.email = email;
    if (mobile != null)       this.mobile = mobile;
    if (birthday != null)     this.birthday = birthday;
    if (weight != null)       this.weight = weight;
    if (height != null)       this.height = height;
    if (profilePhoto != null) this.profilePhoto = profilePhoto;
    notifyListeners();
  }
}