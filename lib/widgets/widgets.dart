// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, must_be_immutable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:easy_nutrition/services/patient_services.dart';
import 'package:easy_nutrition/services/user_service.dart';
import 'package:easy_nutrition/utilities/designs.dart';

class MyAppBarTitle extends StatelessWidget {
  late BuildContext context;
  MyAppBarTitle({Key? key, required this.context}) : super(key: key);

  final UserService _userService = UserService();
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userService.getUser(currentUser.uid),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          Text("Cargando");
        }
        var myUser = snapshot.data;
        var userType = myUser!.userType;
        if (userType == "patient") {
          return PatientTitle(context);
        }
        if (userType == 'nutritionist') {
          return NutritionTitle(context);
        }
        return Center(child: Text("Falla en la carga"));
      },
    );
  }

  Widget PatientTitle(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(currentUser.photoURL!),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hola, ${currentUser.displayName}",
                style: myHeading4,
              ),
              Text(
                "Paciente | Plan Free",
                style: myHeading5,
              )
            ],
          ),
        ),
        Spacer(),
        Icon(Icons.notifications_none_outlined)
      ],
    );
  }

  Widget NutritionTitle(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(currentUser.photoURL!),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hola, ${currentUser.displayName}",
                style: myHeading4,
              ),
              Text(
                "Nutricionista",
                style: myHeading5,
              )
            ],
          ),
        ),
        Spacer(),
        Icon(Icons.notifications_none_outlined)
      ],
    );
  }
}

void logOut(BuildContext context) {
  PatientService _patientServices = PatientService();
  _patientServices.signOutPatient(context);
}
