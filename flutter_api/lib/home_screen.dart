import 'package:flutter/material.dart';
import 'package:flutter_api/model/produk_model.dart';
import 'package:flutter_api/service/produk_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Produk> listProduk = [];
  ProdukService produkService = ProdukService();

  getData() async {
    listProduk = await produkService.getData();
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas API"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.lightBlueAccent])),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child:
                          Text("Nama Produk : ${listProduk[index].namaProduk}"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                          "Jenis Produk : ${listProduk[index].tipeProduk}"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Text("Harga : Rp.${listProduk[index].harga}"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Text("Stok : ${listProduk[index].stok}"),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: listProduk.length),
        ),
      ),
    );
  }
}
