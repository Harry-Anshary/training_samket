import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kurir Sampah Market"),
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/kalkulatorpage");
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                // margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.greenAccent[400],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calculate),
                    SizedBox(width: 10),
                    Text(
                      "Kalkulator",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/kalkulatorpage2");
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                // margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.greenAccent[400],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calculate),
                    SizedBox(width: 10),
                    Text(
                      "Kalkulator Ver2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
