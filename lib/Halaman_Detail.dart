import 'package:flutter/material.dart';
import 'package:kuis_prak_pam/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';



class HalamanDetail extends StatelessWidget {
  final Diseases id ;
  const HalamanDetail({super.key, required this.id});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('halaman detail'),
      ),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height /2,
          width: MediaQuery.of(context).size.width /2,
          child: Image.network(id.imgUrls),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(id.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.teal),),
            SizedBox(height: 20,),
            Text(
                id.plantName,
             style: TextStyle(
              fontSize: 18,
              color: Colors.blueGrey,
             ),),
            SizedBox(height: 20,),
            Text(id.symptom,
            style : TextStyle(
              fontSize: 16
            )),
            SizedBox(height: 20,),
            Text(id.nutshell[0],
            style: TextStyle(
              fontSize: 16
            ),),
          ],
        ),
      ],


      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchUrl(id.imgUrls);
        },
        icon: const Icon(Icons.link),
        label: const Text('Link'),
        backgroundColor: Colors.green,
      ),
    );
  }
}


Future<void> _launchUrl(String url) async{
  final Uri _url = Uri.parse(url);
  if(!await launchUrl(_url)){
    throw Exception('Link gagal dibuka : ${_url}');
  }
}
