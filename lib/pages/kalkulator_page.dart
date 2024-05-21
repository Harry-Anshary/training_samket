import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:kurir_samket_2/component/kalkulator_tile.dart';
import 'package:kurir_samket_2/models/db_item_sampah.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  double num1 = 0;
  int harga = 800;
  double exp = 0;
  double hrg = 0;
  ItemSampahDataBase db = ItemSampahDataBase();
  final teksController = TextEditingController(text: '0');
  /* final expressions = [
    "2 + 2",
    "(3 + 2)^3",
    "3 * pi / 4",
    "3 * sin(5 * pi / 6)",
    "e^(-1)"
  ]; */
  String ubah = "";
  String desimal = "";

  /* double evaluateExpression(String exp) {
    return exp.interpret().toDouble();
    print(exp);
  } */
  void cetakValue() {
    setState(() {
      ubah = teksController.text;
      print(ubah);
      exp = ubah.interpret().toDouble();
      print(exp);
      desimal = exp.toStringAsFixed(1);
      exp = double.parse(desimal);
      hrg = double.parse(desimal) * harga;

      
      /* print("$ubah = ${ubah.interpret()}");
      for (final expression in expressions) {
        print("'$expression' -> ${expression.interpret()}");
      } */
    });
  }

  @override
  void dispose() {
    teksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kalkulator Samket"),
        backgroundColor: Colors.greenAccent[400],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding:
                const EdgeInsets.only(top: 5, bottom: 8, left: 20, right: 20),
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
                      const Text("Kardus"),
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
                    contentPadding: const EdgeInsets.only(
                        top: 4, bottom: 4, right: 15, left: 15),
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
          ),
          Text(num1.toString()),
          // Text(num2.toString()),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // num1 = ;
              });
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(exp.toString()),
                  );
                },
              );
            },
            tooltip: "Bring me the value",
            child: const Icon(Icons.text_fields),
          ),
          /* FloatingActionButton(
            onPressed: cetakValue,
            tooltip: "Bring me the value",
            child: const Icon(Icons.text_fields),
          ),//tidak boleh pakai 2 floating action button */
        ],
      ),
      /* body: ListView.builder(
        itemCount: db.itemSampah.length,
        itemBuilder: (context, index) {
          return KalkulatorTile(
            namaSampah: db.itemSampah[index][0],
            harga: db.itemSampah[index][1],
            exp: 0,
            hrg: 0,
            cetakValue: cetakValue,
          );
        },
      ), */
    );
  }
}
