import 'package:flutter/material.dart';
import 'package:keuangan_flutter/app/core/constans/value.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 227, 234, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'MoneyMe',
            style: TextStyle(
                fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Container(
            height: 400,
            // width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home.png'))),
          ),
          Container(
            padding: EdgeInsets.all(padding),
            child: Text(
              'Manage All Your Transactions On One App',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
