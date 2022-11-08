// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_nutrition/layout/admin/complaint_detail.dart';
import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComplaintListPage extends StatelessWidget {
  const ComplaintListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text("Libro de reclamaciones"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("complaints")
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                var complaint =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return complaintItem(complaint, context);
              }),
            ),
          );
        },
      ),
    );
  }

  Widget complaintItem(Map<String, dynamic> complaint, BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            return ComplaintDetailPage(
              complaint: complaint,
            );
          }));
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nombre: ${complaint["name"]}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tipo: ${complaint["claimType"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            Text(
              'Fecha: ' +
                  DateFormat('dd/MM/y')
                      .format((complaint["date"] as Timestamp).toDate()),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
