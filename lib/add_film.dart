
import 'package:flutter/material.dart';

import 'Home.dart';
import 'SQLDB.dart';

class AddFilm extends StatefulWidget {
  const AddFilm({Key? key}) : super(key: key);

  @override
  State<AddFilm> createState() => _AddFilmState();
}

class _AddFilmState extends State<AddFilm> {
TextEditingController _titre = TextEditingController();
TextEditingController _duree = TextEditingController();
SQLdb sqLdb = SQLdb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajout"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children:  [
            SizedBox(height: 20,),
            TextField(
              controller: _titre,
              style: const TextStyle(fontSize: 20,color: Colors.purple),
              decoration: const InputDecoration(
                labelText: "Titre",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _duree,
              style: TextStyle(fontSize: 20,color: Colors.purple),
              decoration: InputDecoration(
                labelText: "Durée",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed:() async{
                  int rep = await sqLdb.insertData("INSERT INTO 'films' (titre, duree) VALUES (\"${_titre.text}\",${int.parse(_duree.text)})");
                  if(rep>0){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context)=>Home()),
                            (route) => false);
                  }
                },
                child: Container(child: Icon(Icons.add, size: 30,), width: double.infinity,))
          ],
        ),
      ),
    );
  }
}