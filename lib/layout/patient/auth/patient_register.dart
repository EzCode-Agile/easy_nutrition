// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:easy_nutrition/services/patient_services.dart';
import 'package:easy_nutrition/utilities/designs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientRegister extends StatefulWidget {
  const PatientRegister({super.key});

  @override
  State<PatientRegister> createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _keyForm = GlobalKey<FormState>();
    final user = FirebaseAuth.instance.currentUser!;

    nameController.text = user.displayName!;
    emailController.text = user.email!;

    return Scaffold(
        appBar: AppBar(
          title: Text("Registro Paciente"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _keyForm,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Text("Registro de datos"),
                    Text(
                        "Registre sus datos para brindarle una mejor atención"),
                    InputTextWidget(
                      //! Nombre
                      Controller: nameController,
                      Formatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                      ],
                      Label: 'Nombres',
                      inputType: TextInputType.text,
                      Validator: (value) {
                        return ValidateText("Nombre", value!);
                      },
                      Enabled: true,
                    ),
                    InputTextWidget(
                      //! Correo
                      Controller: emailController,
                      Formatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                      ],
                      Label: 'Correo',
                      inputType: TextInputType.emailAddress,
                      Enabled: false,
                    ),
                    InputTextWidget(
                      //! Celular
                      Controller: phoneNumberController,
                      Formatters: [FilteringTextInputFormatter.digitsOnly],
                      Label: 'Celular',
                      inputType: TextInputType.number,
                      Validator: (value) {
                        return ValidatePhoneNumber(value!);
                      },
                      Enabled: true,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          style: styleGreenLargeButton,
                          onPressed: () => {
                            insertDataPatient(
                                user.uid,
                                nameController.text,
                                emailController.text,
                                phoneNumberController.text,
                                user.photoURL!,
                                context),
                          },
                          child: const Text('SIGUIENTE', style: myHeading5),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}

class InputTextWidget extends StatelessWidget {
  InputTextWidget({
    required this.Controller,
    required this.Formatters,
    required this.Label,
    required this.inputType,
    this.Validator,
    required this.Enabled,
  });

  final TextEditingController Controller;
  final TextInputType inputType;
  final List<TextInputFormatter> Formatters;
  final String Label;
  final FormFieldValidator<String>? Validator;
  final bool Enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(fontSize: 13.0),
        enabled: Enabled,
        controller: Controller,
        keyboardType: inputType,
        inputFormatters: Formatters,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          border: OutlineInputBorder(),
          labelText: Label,
          labelStyle: myHeading5,
        ),
        validator: Validator,
      ),
    );
  }
}

String? ValidateText(String label, String value) {
  if (value.isEmpty) {
    return '$label es obligatorio';
  }
  if (value.length < 3) {
    return '$label debe tener mínimo 3 carácteres';
  }
  return null;
}

String? ValidatePhoneNumber(String value) {
  if (value.isEmpty) {
    return 'Celular es obligatorio';
  }
  if (value[0] != '9') {
    return 'Celular debe comenzar con 9';
  }
  if (value.length != 9) {
    return 'Celular debe tener 9 dígitos';
  }
  return null;
}

void insertDataPatient(String id, String name, String email, String phoneNumber,
    String photoUrl, BuildContext context) {
  PatientService _patientService = PatientService();

  _patientService.createPatient(
      id, name, email, phoneNumber, photoUrl, context);
}
