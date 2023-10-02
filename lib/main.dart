import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/disease_data.dart';
import 'package:kuis_prak_pam/Halaman_Detail.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ListView.builder(
            itemCount: listDisease.length,
            itemBuilder: (context, index) {
              final Diseases id = listDisease[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HalamanDetail(id: id,);
                  }));
                },
                child: Card(child: Row(
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 4,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 4,
                      child: Image.network(id.imgUrls),
                    ), SizedBox(width: 20),
                    Text(id.name)
                  ],
                ),),
              );
            }),
      ),
    );
  }
}
