import 'dart:convert';
import 'package:apis/models/postproducts.dart';
import 'package:http/http.dart' as http;

class PostServices {
  Future<PostProducts> addPost(PostProducts data) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('https://dummyjson.com/posts/add'));
    request.body = json.encode({
      "title": "FASDF",
      "userId": 5,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("${response.statusCode}");
    print("clicked");
    if (response.statusCode == 200) {
      print("response true ");
      String responseData = await response.stream.bytesToString();
      var jsonData = json.decode(responseData);

      PostProducts newPost = PostProducts.fromJson(jsonData);
      print('New Post: $newPost');
      return newPost;
    } else {
      print(response.reasonPhrase);
      return PostProducts();
    }
  }
}
