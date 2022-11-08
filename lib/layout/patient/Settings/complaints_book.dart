// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_nutrition/layout/patient/patient_tabs.dart';
import 'package:easy_nutrition/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:easy_nutrition/layout/patient/designs.dart';

class ComplaintsBookPage extends StatelessWidget {
  const ComplaintsBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text("Libro de reclamaciones"),
        ),
        body: MyForm());
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  UserService userService = UserService();

  final clientDatakeyForm = GlobalKey<FormState>();
  final servicesDatakeyForm = GlobalKey<FormState>();
  final descriptionDatakeyForm = GlobalKey<FormState>();
  final footerKeyForm = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final dniController = TextEditingController();
  final phoneController = TextEditingController();

  String? servicesType = 'Producto';
  final amountController = TextEditingController();
  final servicesDescriptionController = TextEditingController();

  String? claimType = 'Reclamo';
  final claimDescriptionController = TextEditingController();
  final orderDescriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    dniController.dispose();
    phoneController.dispose();

    amountController.dispose();
    servicesDescriptionController.dispose();

    claimDescriptionController.dispose();
    orderDescriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbVisibility: true,
      thumbColor: myGreenColor,
      thickness: 10,
      radius: Radius.circular(10),
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                clientDataForm(),
                servicesDataForm(),
                descriptionDataForm(),
                footer(),
                btnEnviar(),
              ],
            )),
      ),
    );
  }

  Widget clientDataForm() {
    nameController.text = currentUser.displayName!;
    emailController.text = currentUser.email!;
    addressController.text = 'Av. Jose Leal 720';
    dniController.text = '32512622';
    phoneController.text = '926672220';
    return Form(
      key: clientDatakeyForm,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person_outline,
                color: myGreenColor,
                size: 40,
              ),
              Text(
                "Identificación del consumidor",
                style: myTitleStyle,
              ),
            ],
          ),
          //!Nombres
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              validator: (value) {
                return validateText("Nombre y Apellidos", value!);
              },
              decoration: myInputDecoration("Nombre y Apellidos"),
            ),
          ),
          //!Email
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              validator: (value) {
                return validateText("Email", value!);
              },
              decoration: myInputDecoration("Email"),
            ),
          ),
          //!DNI
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: dniController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                return validateNumber("Documento de identidad", 8, value!);
              },
              decoration: myInputDecoration("Documento de identidad"),
            ),
          ),
          //!Domicilio
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: addressController,
              validator: (value) {
                return validateText("Domicilio", value!);
              },
              decoration: myInputDecoration("Domicilio"),
            ),
          ),
          //!Telefono
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                return validateNumber("Teléfono", 9, value!);
              },
              decoration: myInputDecoration("Teléfono"),
            ),
          )
        ],
      ),
    );
  }

  Widget servicesDataForm() {
    amountController.text = '100';
    servicesDescriptionController.text = 'Problema con la subscripción mensual';
    return Form(
      key: servicesDatakeyForm,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.file_open,
                color: myGreenColor,
                size: 40,
              ),
              Text(
                "Identificación del bien contratado",
                style: myTitleStyle,
              ),
            ],
          ),
          //!Tipo de servicio
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: 'Producto',
                    activeColor: myGreenColor,
                    groupValue: servicesType,
                    onChanged: ((value) => setState(
                          () => servicesType = value.toString(),
                        )),
                  ),
                  Text("Producto"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Servicio',
                    activeColor: myGreenColor,
                    groupValue: servicesType,
                    onChanged: ((value) => setState(
                          () => servicesType = value.toString(),
                        )),
                  ),
                  Text("Servicio"),
                ],
              )
            ],
          ),
          //!Monto Reclamado
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                return validateNumber("Monto reclamado", 0, value!);
              },
              decoration: myInputDecoration("S/. Monto reclamado"),
            ),
          ),
          //!Descripción
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: servicesDescriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLines: 6,
              validator: (value) {
                return validateText("Descripción del bien contratado", value!);
              },
              decoration: myInputDecoration("Descripción del bien contratado"),
            ),
          )
        ],
      ),
    );
  }

  Widget descriptionDataForm() {
    claimDescriptionController.text =
        'Se me realizó un doble cobro de la mensualidad en mi tarjeta';
    orderDescriptionController.text =
        'El 5 de noviembre se me realizó el cobro mensual de la subscripción, y el 6 de noviembre se volvió a cobrar. Lo cual no tiene ningún sentido. Quiero la devolución de mi dinero';
    return Form(
      key: descriptionDatakeyForm,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.file_copy,
                color: myGreenColor,
                size: 40,
              ),
              Text(
                "Detalle de la reclamación",
                style: myTitleStyle,
              ),
            ],
          ),
          //!Tipo de reclamo
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: 'Reclamo',
                    activeColor: myGreenColor,
                    groupValue: claimType,
                    onChanged: ((value) => setState(
                          () => claimType = value.toString(),
                        )),
                  ),
                  Text("Reclamo"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Queja',
                    activeColor: myGreenColor,
                    groupValue: claimType,
                    onChanged: ((value) => setState(
                          () => claimType = value.toString(),
                        )),
                  ),
                  Text("Queja"),
                ],
              )
            ],
          ),
          //!Descripción
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: claimDescriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLines: 6,
              validator: (value) {
                return validateText("Descripción de la reclamación", value!);
              },
              decoration: myInputDecoration("Descripción de la reclamación"),
            ),
          ),
          //!Pedido
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: orderDescriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLines: 6,
              validator: (value) {
                return validateText("Pedido de la reclamación", value!);
              },
              decoration: myInputDecoration("Pedido de la reclamación"),
            ),
          )
        ],
      ),
    );
  }

  Widget footer() {
    return Form(
      key: footerKeyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "DEBES SABER:",
              style: myTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "* La respuesta de su reclamo o queja será notificada a la dirección o E-mail indicado.",
              style: myBodyStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "* La formulación del reclamo no impide acudir a otras vías de solución de controversias ni es requisito previo para interponer una denuncia ante el INDECOPI.",
              style: myBodyStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "* El proveedor deberá dar respuesta al reclamo en un plazo no mayor de quince (15) días hábiles improrrogables.",
              style: myBodyStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          CheckboxListTileFormField(
              title: Text(
                  "Declaro que los datos consignados son correctos y fiel expresión de la verdad."),
              errorColor: Colors.red,
              activeColor: myGreenColor,
              validator: ((bool? value) {
                if (value!) {
                  return null;
                }
                return 'Este campo es obligatorio';
              })),
        ],
      ),
    );
  }

  Widget btnEnviar() {
    DateTime dateTime = DateTime.now();
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0),
          backgroundColor: myGreenColor,
          foregroundColor: myBlackColor,
          fixedSize: Size(180.0, 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          clientDatakeyForm.currentState!.validate();
          servicesDatakeyForm.currentState!.validate();
          descriptionDatakeyForm.currentState!.validate();
          footerKeyForm.currentState!.validate();
          if (clientDatakeyForm.currentState!.validate() &&
              servicesDatakeyForm.currentState!.validate() &&
              descriptionDatakeyForm.currentState!.validate() &&
              footerKeyForm.currentState!.validate()) {
            String complaintId =
                FirebaseFirestore.instance.collection("complaints").doc().id;

            FirebaseFirestore.instance
                .collection("complaints")
                .doc(complaintId)
                .set({
              'id': complaintId,
              'name': nameController.text,
              'email': emailController.text,
              'address': addressController.text,
              'dni': dniController.text,
              'phone': phoneController.text,
              'servicesType': servicesType,
              'amount': amountController.text,
              'servicesDescription': servicesDescriptionController.text,
              'claimType': claimType,
              'claimDescription': claimDescriptionController.text,
              'orderDescription': orderDescriptionController.text,
              'date': dateTime,
              'isFinished': false
            });
            popUpExito(context);
          } else {
            popUpFallido(context);
          }
        },
        child: Text("ENVIAR"),
      ),
    );
  }
}

InputDecoration myInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    alignLabelWithHint: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 3),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 3, color: myGreenColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 3, color: Colors.red),
    ),
  );
}

String? validateText(String label, String value) {
  if (value.isEmpty) {
    return '$label es obligatorio';
  }
  if (value.length < 3) {
    return '$label debe tener mínimo 3 caracteres';
  }
  return null;
}

String? validateNumber(String label, int length, String value) {
  if (value.isEmpty) {
    return '$label es obligatorio';
  }
  if (length != 0) {
    if (value.length != length) {
      return '$label no es válido';
    }
  }
  return null;
}

Future<void> popUpExito(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding:
            const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10.0),
        actionsPadding: const EdgeInsets.only(bottom: 10),
        title: const Text(
          'Reclamo Registrada',
          style: TextStyle(fontSize: 16.0),
        ),
        content: RichText(
          text: TextSpan(
            text: 'Su reclamo se registró correctamente.',
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 14.0),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "ACEPTAR",
              style: TextStyle(fontSize: 12.0, color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PatientTabs()));
            },
          )
        ],
      );
    },
  );
}

Future<void> popUpFallido(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding:
            const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10.0),
        actionsPadding: const EdgeInsets.only(bottom: 10),
        title: const Text(
          'Algo salió mal',
          style: TextStyle(fontSize: 16.0),
        ),
        content: RichText(
          text: TextSpan(
            text:
                'Su reclamo no fue registrada. Por favor, valide que todo haya llenado todos los campos.',
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 14.0),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "ACEPTAR",
              style: TextStyle(fontSize: 12.0, color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
