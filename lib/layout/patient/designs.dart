// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const Color myGreenColor = Color(0xFF2BB54E);
const Color myGreyColor = Color(0xFFE0E0E0);
const Color myBlackColor = Colors.black;
const Color myWhiteColor = Colors.white;

const myTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: myGreenColor,
  fontSize: 20,
);

const myBodyStyle = TextStyle(
  fontWeight: FontWeight.normal,
  color: myGreenColor,
  
  fontSize: 14,
);

const myStyleBold20 = TextStyle(
  fontWeight: FontWeight.bold,
  color: myBlackColor,
  fontSize: 20,
);

const myStyleBold16 = TextStyle(
  fontWeight: FontWeight.bold,
  color: myBlackColor,
  fontSize: 16,
);

const myStyleBold12 = TextStyle(
  fontWeight: FontWeight.bold,
  color: myBlackColor,
  fontSize: 12,
);

const myStyleNormal20 = TextStyle(
  fontWeight: FontWeight.normal,
  color: myBlackColor,
  fontSize: 20,
);

const myStyleNormal16 = TextStyle(
  fontWeight: FontWeight.normal,
  color: myBlackColor,
  fontSize: 16,
);

const myStyleNormal12 = TextStyle(
  fontWeight: FontWeight.normal,
  color: myBlackColor,
  fontSize: 12,
);

ButtonStyle styleGreenLargeButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(myGreenColor),
  foregroundColor: MaterialStateProperty.all<Color>(myBlackColor),
  fixedSize: MaterialStateProperty.all(const Size(300, 50)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

ButtonStyle styleGreyLargeButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(myGreyColor),
  foregroundColor: MaterialStateProperty.all<Color>(myBlackColor),
  fixedSize: MaterialStateProperty.all(const Size(300, 50)),
  side: MaterialStateProperty.all(BorderSide(
    color: myGreenColor,
    width: 100.0,
    style: BorderStyle.solid,
  )),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

final currentUser = FirebaseAuth.instance.currentUser!;

class MyAppBarTitle extends StatelessWidget {
  const MyAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(currentUser.photoURL!),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola, ${currentUser.displayName}",
              style: myStyleBold20,
            ),
            Text(
              "Patient | Free",
              style: myStyleNormal16,
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.notifications_none_outlined)
      ],
    );
  }
}

class MyPremiunButton extends StatelessWidget {
  const MyPremiunButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: styleGreyLargeButton,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.diamond_outlined,
            color: myGreenColor,
          ),
          SizedBox(width: 10),
          Text(
            "Conviertete en premiun",
            style: myStyleBold20,
          )
        ],
      ),
    );
  }
}
