// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:easy_nutrition/layout/admin/admin_home.dart';
import 'package:easy_nutrition/layout/patient/Settings/complaints_book.dart';
import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientSettings extends StatefulWidget {
  const PatientSettings({super.key});

  @override
  State<PatientSettings> createState() => _PatientSettingsState();
}

class _PatientSettingsState extends State<PatientSettings> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          profile(context),
          kcal(context),
          MyPremiunButton(),
          SizedBox(height: 15),
          buttons(context),
        ],
      ),
    );
  }

  Widget profile(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(currentUser.photoURL!, scale: 1),
        ),
        SizedBox(height: 15),
        Text(
          currentUser.displayName!,
          style: myStyleBold20,
        )
      ],
    );
  }

  Widget kcal(BuildContext context) {
    String kcal = "2000";
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Tus calorias recomendadas: ",
            style: myStyleNormal16,
          ),
          Text(
            "$kcal kcal",
            style: myStyleBold16,
          ),
        ],
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.account_box),
              SizedBox(width: 15),
              Text(
                "Información personal",
                style: myStyleNormal20,
              ),
            ],
          ),
          style: styleGreyLargeButton,
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 15),
              Text(
                "Cuenta",
                style: myStyleNormal20,
              ),
            ],
          ),
          style: styleGreyLargeButton,
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.payment),
              SizedBox(width: 15),
              Text(
                "Métodos de pago",
                style: myStyleNormal20,
              ),
            ],
          ),
          style: styleGreyLargeButton,
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.lock),
              SizedBox(width: 15),
              Text(
                "Cambiar contraseña",
                style: myStyleNormal20,
              ),
            ],
          ),
          style: styleGreyLargeButton,
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return const AdminHome();
            }));
          },
          child: Row(
            children: [
              Icon(Icons.notifications_none),
              SizedBox(width: 15),
              Text(
                "Activar notificaciones",
                style: myStyleNormal20,
              ),
            ],
          ),
          style: styleGreyLargeButton,
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return const ComplaintsBookPage();
            }));
          },
          child: Row(
            children: [
              Icon(Icons.book),
              SizedBox(width: 15),
              Text(
                "Libro de reclamaciones",
                style: myStyleNormal20,
              ),
            ],
          ),
          style: styleGreyLargeButton,
        ),
      ],
    );
  }
}
