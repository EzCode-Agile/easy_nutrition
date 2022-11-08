// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComplaintDetailPage extends StatelessWidget {
  final Map<String, dynamic> complaint;
  const ComplaintDetailPage({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text("Detalle de reclamo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //!Código
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Código de reclamo:',
                        style: myStyleNormal20,
                      ),
                      Text(
                        complaint['id'],
                        style: myStyleNormal20,
                      ),
                    ],
                  ),
                ),
                //!Fecha
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Fecha de reclamo:',
                        style: myStyleNormal20,
                      ),
                      Text(
                        DateFormat('dd/MM/y')
                            .format((complaint["date"] as Timestamp).toDate()),
                        style: myStyleNormal20,
                      ),
                    ],
                  ),
                ),
                //!Estado
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Estado del reclamo: ",
                      style: myStyleNormal20,
                    ),
                    complaint['isFinished']
                        ? Text(
                            'Finalizado',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: myGreenColor),
                          )
                        : Text(
                            'Pendiente',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                  ],
                ),
                //!Identificación del consumidor
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
                //!Nombre
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nombre: ${complaint['name']}',
                    style: myStyleNormal20,
                  ),
                ),
                //!Correo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Correo: ${complaint['email']}',
                    style: myStyleNormal20,
                  ),
                ),
                //!Domicilio
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Domicilio: ${complaint['address']}',
                    style: myStyleNormal20,
                  ),
                ),
                //!DNI
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'DNI: ${complaint['dni']}',
                    style: myStyleNormal20,
                  ),
                ),
                //!Teléfono
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Teléfono: ${complaint['phone']}',
                    style: myStyleNormal20,
                  ),
                ),
                //!Identificación del bien contratado
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                //!Tipo de servicio
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Tipo: ${complaint['servicesType']}',
                        style: myStyleNormal20,
                      ),
                      Text(
                        'Monto: S/.${complaint['amount']}',
                        style: myStyleNormal20,
                      ),
                    ],
                  ),
                ),
                //!Descripción
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Descripción del bien contratado: ',
                        style: myStyleNormal20,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration:
                            myInputDecoration(complaint['servicesDescription']),
                        minLines: 6,
                        maxLines: 6,
                        enabled: false,
                        style: myStyleNormal20,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                //!Detalle de la reclamación
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                //!Tipo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tipo: ${complaint['claimType']}',
                    style: myStyleNormal20,
                  ),
                ),
                //!Descripción
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Descripción del reclamo: ',
                        style: myStyleNormal20,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration:
                            myInputDecoration(complaint['claimDescription']),
                        minLines: 6,
                        maxLines: 6,
                        enabled: false,
                        style: myStyleNormal20,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                //!Petición
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Petición del reclamo: ',
                        style: myStyleNormal20,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration:
                            myInputDecoration(complaint['orderDescription']),
                        minLines: 6,
                        maxLines: 6,
                        enabled: false,
                        style: myStyleNormal20,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration myInputDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    alignLabelWithHint: true,
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 3, color: myGreenColor),
    ),
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
