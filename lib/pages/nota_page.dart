import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotaPage extends StatefulWidget {
  final List nama;
  final List hargaSatuan;
  final List<double>? beratTotal;
  final List<int>? total;
  final String totalHarga2;
  final String namaPembeli;

  NotaPage(
      {super.key,
      required this.nama,
      required this.namaPembeli,
      required this.totalHarga2,
      required this.hargaSatuan,
      required this.beratTotal,
      required this.total});

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {
  final tanggal = new DateTime.now();
  // String tanggal2 = tanggal.toString();
  late String formatter = DateFormat.yMMMd().format(tanggal); // 28/03/2020
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tanggal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        centerTitle: true,
        title: const Text(
          "Nota Penjualan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.greenAccent[100],
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /* Container(
                    // height: ScreenUtil().setHeight(80),
                    // width: ScreenUtil().setWidth(80),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Image(
                        image: AssetImage("assets/images/logo2.png"))), */
                Column(
                  children: [
                    Text("Nota Penjualan Sampah Market"),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pelanggan"),
                            Text("Tanggal"),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(': ${widget.namaPembeli}'),
                            Text(': ${formatter.toString()}'),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("Detail Penjualan"),
          const SizedBox(height: 5),
          const Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  " Nama Barang ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  " Massa ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  " Harga Satuan ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  " Harga Total ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.nama.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 1.0,
                  ))),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            widget.nama[index],
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            widget.beratTotal![index].toString(),
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Rp${widget.hargaSatuan[index].toString()}',
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Rp${widget.total![index].toString()}',
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.greenAccent[400],
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Total Penjualan: Rp${widget.totalHarga2}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
