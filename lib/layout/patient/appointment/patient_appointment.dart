// ignore_for_file: prefer_const_constructors

import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:flutter/material.dart';

class PatientAppointment extends StatelessWidget {
  const PatientAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: nutritionistList(context),
          ),
          myNutritionistButton(context),
        ],
      ),
    );
  }

  Widget nutritionistList(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "Lista de nutricionistas",
            style: myStyleBold20,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return nutritionistItemCard(context);
              }),
        ),
      ],
    );
  }

  Widget nutritionistItemCard(BuildContext context) {
    String name = "Eduardo Jimenez";
    String age = "40";
    String image =
        "https://previews.123rf.com/images/feedough/feedough1309/feedough130901394/22478796-cara-de-un-maduro-m%C3%A9dico-sonriendo-a-la-c%C3%A1mara.jpg";

    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(image)),
      title: Text(name),
      subtitle: Text(
        "Edad: $age",
      ),
      trailing: Icon(Icons.arrow_right),
      onTap: () {},
    );
  }

  Widget myNutritionistButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        style: styleGreenLargeButton,
        child: Text("Mis Nutricionistas"),
      ),
    );
  }
}
