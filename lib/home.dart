import 'package:apis/models/postproducts.dart';
import 'package:apis/models/products.dart';
import 'package:apis/services/postservices.dart';
import 'package:apis/services/remoteservices.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var isLoaded = false;
  List<Products>? products;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    products = await RemoteService().getPosts();
    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: ElevatedButton(
          child: Text('submit'),
          onPressed: () async {
            PostProducts data = PostProducts(title: "ABC", userId: 1);
            var result = await PostServices().addPost(data);
            print('result ${result.title}');
          },
        ));
    // body: Visibility(
    //   visible: isLoaded,
    //   child: ListView.builder(
    //     itemCount: products?.length ?? 0, // Ensure products is not null
    //     itemBuilder: (context, index) {
    //       // Access the title property of each Products object
    //       String? title = products?[index].title;
    //       return Container(
    //         child: Text(title ??
    //             ''), // Display the title, or an empty string if null
    //       );
    //     },
    //   ),
    //   replacement: CircularProgressIndicator(),
    // ));
  }
}
