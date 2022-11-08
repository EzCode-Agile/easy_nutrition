import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;

  const Patient(
      {this.id, this.name, this.email, this.phoneNumber, this.photoUrl});

  factory Patient.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Patient(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      phoneNumber: data?['phoneNumber'],
      photoUrl: data?['photoUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (photoUrl != null) "photoUrl": photoUrl,
    };
  }
}
