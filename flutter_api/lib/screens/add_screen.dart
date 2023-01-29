import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/screens/list_screen.dart';
import 'package:http/http.dart' as http;

import '../helpers/size_helper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController tipeController = TextEditingController();
  TextEditingController stokController = TextEditingController();

  Future _onSubmit() async {
    try {
      return await http.post(
        Uri.parse("http://192.168.56.1/php_api/api/add.php"),
        body: {
          "nama_produk": namaController.text,
          "harga": hargaController.text,
          "tipe_produk": tipeController.text,
          "stok": stokController.value,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListScreen()),
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 24, right: 24, left: 24),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tambah Data",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                            controller: namaController,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Nama Produk",
                              labelText: "Nama Produk",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input your data!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                            controller: hargaController,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Harga",
                              labelText: "Harga Produk",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input your data!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                            controller: tipeController,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Tipe",
                              labelText: "Tipe Produk",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input your data!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                            controller: stokController,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Stok",
                              labelText: "Stok",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.numbers),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'input data!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18),
                          SizedBox(height: 18),
                          SizedBox(
                            width: displayWidth(context) * 0.7,
                            height: displayHeight(context) * 0.05,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              child: Text("Simpan"),
                              onPressed: () {
                                _onSubmit();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _submit() {
  //   final isValid = _formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   } else {
  //     _showAlertDialog(context);
  //     _formKey.currentState!.save();
  //   }
  // }

  // void _showAlertDialog(BuildContext context) {
  //   showCupertinoModalPopup<void>(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: const Text('Alert'),
  //       content: const Text('Are You Sure?'),
  //       actions: <CupertinoDialogAction>[
  //         CupertinoDialogAction(
  //           isDefaultAction: true,
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: const Text('No'),
  //         ),
  //         CupertinoDialogAction(
  //           isDestructiveAction: true,
  //           onPressed: () {
  //             int price = 0;
  //             String img = "";
  //             String name = nameController.text;
  //             String tanggal = tanggalController.text;
  //             String qty = qtyController.text;
  //           },
  //           child: const Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
