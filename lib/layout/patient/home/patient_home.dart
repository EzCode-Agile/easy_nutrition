// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_nutrition/layout/patient/designs.dart';
import 'package:flutter/material.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          nutritionist(context),
          buttons(context),
          nutritionalTip(context),
          MyPremiunButton()
        ],
      ),
    );
  }

  Widget nutritionist(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          Text(
            "No cuentas con un nutricinista asignado actualmente",
            style: myStyleBold16,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 15),
          Text(
            "Podrás visualizar tus reservaciones pendientes en cuánto tu nutricionista lo solicite",
            style: myStyleNormal16,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: styleGreenLargeButton,
          onPressed: () {},
          child: Text(
            "Citas",
            style: myStyleBold16,
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          style: styleGreenLargeButton,
          onPressed: () {},
          child: Text(
            "Citas Pendientes",
            style: myStyleBold16,
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          style: styleGreenLargeButton,
          onPressed: () {},
          child: Text(
            "Nutricionistas",
            style: myStyleBold16,
          ),
        )
      ],
    );
  }

  Widget nutritionalTip(BuildContext context) {
    String tip =
        "Controla la porción de tus alimentos usando guías de medición como tus manos.";
    String tipImage =
        "https://s03.s3c.es/imag/_v0/770x420/1/9/8/490x_habitos-saludables.jpg";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Tip Nutricional del día",
            style: myStyleBold16,
          ),
          SizedBox(height: 15),
          Text(
            "Debes consultar con tu nutricionista para que evalúe tu caso particular",
            style: myStyleNormal16,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width - 80,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.0),
              image: DecorationImage(
                image: NetworkImage(tipImage), //! Tip image
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              height: MediaQuery.of(context).size.height * 0.2,
              margin: EdgeInsets.only(left: 140, right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  tip, //! Tip
                  style: myStyleBold20,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
