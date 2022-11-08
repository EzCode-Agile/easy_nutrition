// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, dead_code, avoid_print, prefer_interpolation_to_compose_strings

import 'package:easy_nutrition/layout/patient/Settings/patient_settings.dart';
import 'package:easy_nutrition/layout/patient/appointment/patient_appointment.dart';
import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:easy_nutrition/layout/patient/home/patient_home.dart';
import 'package:easy_nutrition/layout/shared/chat/chat_page.dart';
import 'package:flutter/material.dart';

class PatientTabs extends StatefulWidget {
  const PatientTabs({Key? key}) : super(key: key);

  @override
  _PatientTabsState createState() => _PatientTabsState();
}

class _PatientTabsState extends State<PatientTabs> {
  int _selectedIndex = 0;

  final List<Widget> _patientTabs = [
    PatientHome(),
    PatientAppointment(),
    ChatPage(),
    PatientSettings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhiteColor,
      appBar: myAppBar(context),
      body: _patientTabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: myBlackColor,
            ),
            label: 'Inicio',
            backgroundColor: myGreenColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
              color: myBlackColor,
            ),
            label: 'Reserva',
            backgroundColor: myGreenColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: myBlackColor,
            ),
            label: 'Chat',
            backgroundColor: myGreenColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: myBlackColor,
            ),
            label: 'Ajustes',
            backgroundColor: myGreenColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: myBlackColor,
        onTap: _onItemTapped,
        iconSize: 45.0,
      ),
    );
  }

  PreferredSizeWidget? myAppBar(BuildContext context) {
    if (_selectedIndex == 3) {
      return null;
    }
    return AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: myBlackColor,
      backgroundColor: myWhiteColor,
      title: MyAppBarTitle(),
    );
  }
}
