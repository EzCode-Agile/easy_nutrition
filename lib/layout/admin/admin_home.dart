// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:easy_nutrition/layout/admin/complaints_list.dart';
import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  static String id = '/adminHome';

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: myWhiteColor,
        foregroundColor: myGreenColor,
        title: Text("Panel de Administrador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Hola José Sanchez\njsanchez@eznutrition.com",
                style: myTitleStyle,
              ),
            ),
            btnCrearMedico(),
            btnListaMedicos(),
            btnListaPacientes(),
            btnLibroReclamos(),
            btnCerrarSesion()
          ],
        ),
      ),
    );
  }

  Widget btnCrearMedico() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: styleGreenLargeButton,
        child: Text(
          "Crear médico",
          style: myStyleBold20,
        ),
      ),
    );
  }

  Widget btnListaMedicos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {},
          style: styleGreenLargeButton,
          child: Text(
            "Lista médicos",
            style: myStyleBold20,
          )),
    );
  }

  Widget btnLibroReclamos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return const ComplaintListPage();
            }));
          },
          style: styleGreenLargeButton,
          child: Text(
            "Libro de reclamaciones",
            style: myStyleBold20,
          )),
    );
  }

  Widget btnListaPacientes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {},
          style: styleGreenLargeButton,
          child: Text(
            "Lista pacientes",
            style: myStyleBold20,
          )),
    );
  }

  Widget btnCerrarSesion() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {},
          style: styleGreyLargeButton,
          child: Text(
            "Cerrar sesión",
            style: myStyleBold20,
          )),
    );
  }
}
