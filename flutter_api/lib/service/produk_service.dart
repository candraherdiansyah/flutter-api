import 'dart:convert';

import '../model/produk_model.dart';
import 'package:http/http.dart' as http;

class ProdukService {
  final _baseUrl = "http://192.168.56.1/php_api/api/list_produk.php";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Produk> album = it.map((e) => Produk.fromJson(e)).toList();
        return album;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
