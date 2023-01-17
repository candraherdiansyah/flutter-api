class Produk {
  String? id;
  String? namaProduk;
  String? harga;
  String? tipeProduk;
  String? stok;

  Produk({this.id, this.namaProduk, this.harga, this.tipeProduk, this.stok});

  Produk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProduk = json['nama_produk'];
    harga = json['harga'];
    tipeProduk = json['tipe_produk'];
    stok = json['stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_produk'] = this.namaProduk;
    data['harga'] = this.harga;
    data['tipe_produk'] = this.tipeProduk;
    data['stok'] = this.stok;
    return data;
  }
}