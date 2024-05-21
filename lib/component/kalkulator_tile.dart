import 'package:flutter/material.dart';

class KalkulatorTile extends StatelessWidget {
  String namaSampah;
  int harga;
  double exp = 0;
  double hrg = 0;
  Function() cetakValue;
  final teksController = TextEditingController(text: '0');
  KalkulatorTile({
    super.key,
    required this.namaSampah,
    required this.harga,
    required this.exp,
    required this.hrg,
    required this.cetakValue,
    // required this.teksController,
  });

  /* void cetakValue() {
    setState(() {
      ubah = teksController.text;
      exp = ubah.interpret().toDouble();
      desimal = exp.toStringAsFixed(1);
      exp = double.parse(desimal);
      hrg = double.parse(desimal) * harga;
      /* print("$ubah = ${ubah.interpret()}");
      for (final expression in expressions) {
        print("'$expression' -> ${expression.interpret()}");
      } */
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: const EdgeInsets.only(top: 5, bottom: 8, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.greenAccent[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text (namaSampah),
                Text("Rp.$harga/Kg"),
              ],
            ),
          ),
          TextField(
            controller: teksController,
            keyboardType: TextInputType.phone,
            // maxLines: 2,
            // style: TextStyle(fontSize: 40.0, height: 0.0),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(top: 4, bottom: 4, right: 15, left: 15),
              isDense: true,
              fillColor: Colors.greenAccent[100],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Total Massa",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Harga",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      ": $exp",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ": Rp.$hrg",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 1),
                Container(
                  height: 35,
                  width: 40,
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      elevation: 0.5,
                      backgroundColor: Colors.greenAccent[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: cetakValue,
                    child: const Text(
                      "=",
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
