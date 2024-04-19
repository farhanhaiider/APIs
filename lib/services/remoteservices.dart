import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apis/models/products.dart';

class RemoteService {
  Future<List<Products>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://dummyjson.com/products');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      print('http responding');
      var jsonData = json.decode(response.body) as Map<String, dynamic>;
      var productListJson = jsonData['products'] as List<dynamic>;

      var productsList =
          productListJson.map((json) => Products.fromJson(json)).toList();

      return productsList;
    } else {
      return null;
    }
  }
}
