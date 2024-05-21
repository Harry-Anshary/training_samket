import 'package:function_tree/function_tree.dart';
// import 'package:kurir_samket_2/constant.dart';
import 'package:kurir_samket_2/models/barang_model.dart';
import 'package:kurir_samket_2/models/repository_barang.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';
import 'package:kurir_samket_2/pages/nota_page.dart';

class MyKalkulator extends StatefulWidget {
  const MyKalkulator({super.key});

  @override
  State<MyKalkulator> createState() => _MyKalkulatorState();
}

class _MyKalkulatorState extends State<MyKalkulator> {
  List<TextEditingController>? _controllers = [];
  List<int>? total = [];
  List<Barang> listBarang = [];
  String totalharga2 = '';
  String initialharga = '0';
  List nama = [];
  List hargaSatuan = [];
  List? berTal = [];
  List<double>? beratTotal = [];
  List<double>? massaTotal = [];

  Repository repository = Repository();
  TextEditingController namaPembeli2 = TextEditingController();
  String namaPembeli = '';

  getData() async {
    listBarang = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent[400],
        centerTitle: true,
        title: const Text(
          "Kalkulator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.black,
            // fontSize: ScreenUtil().setSp(15),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: namaPembeli2,
                )),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  namaPembeli = namaPembeli2.text;
                });
              },
              child: const Text('Selesai')),
          Expanded(
            child: ListView.builder(
                itemCount: listBarang.length,
                padding: const EdgeInsets.only(bottom: 60),
                itemBuilder: (context, index) {
                  _controllers?.add(TextEditingController());
                  total?.add(0);
                  beratTotal?.add(0);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listBarang[index].nama.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rp.${listBarang[index].harga.toString()}/Kg',
                              ),
                            ],
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Berat"),
                              TextField(
                                keyboardType: TextInputType.phone,
                                controller: _controllers![index],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 4, bottom: 4, right: 15, left: 15),
                                  isDense: true,
                                  fillColor: Colors.greenAccent[100],
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Total Massa",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "Harga",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('0'),
                                  Text(
                                    ': ${beratTotal?[index].toString()}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ': Rp${total?[index].toString()}',
                                    style: const TextStyle(
                                      fontSize: 14,
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
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      elevation: 0.5,
                                      backgroundColor: Colors.greenAccent[400],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_controllers![index].text.isEmpty) {
                                        print("Text Field Is Empty");
                                      } else {
                                        // var massa = _controllers![index].text.interpret().toDouble();
                                        var beratk = _controllers![index].text;
                                        var beratubah =
                                            beratk.interpret().toDouble();
                                        var desimal =
                                            beratubah.toStringAsFixed(1);
                                        var beratfinal = double.parse(desimal);

                                        nama.add(listBarang[index].nama);
                                        hargaSatuan.add(
                                            int.parse(listBarang[index].harga));
                                        // beratTotal.add(double.parse(
                                        //     _controllers![index].text));
                                        // beratTotal?.add(beratubah);

                                        // var berat = double.parse(
                                        //     _controllers![index].text);

                                        var barang2 =
                                            int.parse(listBarang[index].harga);
                                        var total2 = barang2 * beratfinal;

                                        print(barang2);
                                        print(beratubah);
                                        // beratubah;
                                        total2;
                                        // massa;
                                        // print(massa);

                                        print('dipencet');
                                        setState(() {
                                          // total?.add(total2.toInt());
                                          total![index] = total2.toInt();
                                          beratTotal![index] = beratfinal;
                                          // massaTotal![index] = beratubah.toDouble();
                                          var totalHarga = total!.sum;
                                          // massaTotal![index] = massa;
                                          print(total);
                                          print(listBarang[index].harga);
                                          print(nama);
                                          print(hargaSatuan);
                                          print(beratTotal);
                                          // print(_controllers[]);
                                          totalHarga;
                                          totalharga2 = totalHarga.toString();
                                        });
                                      }
                                    },
                                    child: const Text(
                                      '=',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.black,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NotaPage(
                  namaPembeli: namaPembeli,
                  nama: nama,
                  total: total,
                  beratTotal: beratTotal,
                  hargaSatuan: hargaSatuan,
                  totalHarga2: totalharga2,
                );
              },
            ),
          );
        },
        child: Text(totalharga2.toString()),
      ),
    );
  }
}

// Widget _buildPopupDialog(BuildContext context, nama, hargaSatuan, beratTotal) {
//   return AlertDialog(
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         ListView.builder(
//           itemCount: nama.toString().length,
//           itemBuilder: (context, index) {
//             return Expanded(child: Container(child: Text(nama[index])));
//           },
//         ),
//         // Center(
//         //     child: Text(
//         //   nama,
//         //   style: TextStyle(fontSize: ScreenUtil().setSp(20)),
//         //   textAlign: TextAlign.center,
//         // )),
//         SizedBox(
//           height: ScreenUtil().setHeight(5),
//         ),
//         // Center(
//         //   child: SizedBox(
//         //       height: ScreenUtil().setHeight(300),
//         //       child:
//         //           Image(image: NetworkImage('$url2/storage/${barang.foto}'),fit: BoxFit.cover,)),
//         // ),
//         // SizedBox(height: ScreenUtil().setHeight(5),),
//         // Center(
//         //     child: Text(
//         //   'Rp. ${barang.harga.toString()}',
//         //   style: TextStyle(fontSize: ScreenUtil().setSp(20)),
//         //   textAlign: TextAlign.center,
//         // ))
//       ],
//     ),
//   );
// }
