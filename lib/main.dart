import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
            backgroundColor: Colors.amber[600],
            title: Center(
              child: Text(
                'Yapılacak Görevler',
                style:
                    TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              ),
            )),
        body: AnaEkran(),
      ),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List yapilacaklarlistesi = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: yapilacaklarlistesi.length,
                itemBuilder: (context, indexnumarasi) => ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  leading: Icon(Icons.pending_actions),
                  iconColor: Colors.brown,
                  tileColor: Colors.amber[500],
                  trailing: Container(
                    decoration: BoxDecoration(),
                    child: IconButton(
                      icon: Icon(Icons.remove_circle_outline_sharp),
                      iconSize: 34,
                      color: Colors.red,
                      splashColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          yapilacaklarlistesi.removeAt(indexnumarasi);
                        });
                      },
                    ),
                  ),
                  title: Text(yapilacaklarlistesi[indexnumarasi]),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber[300],
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              cursorColor: Colors.red,
              controller: t1,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.green[600],
                  size: 35,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      yapilacaklarlistesi.add(t1.text);
                      t1.clear();
                    });
                  },
                  iconSize: 32,
                  icon: Icon(Icons.new_label_outlined),
                  color: Colors.green[600],
                  splashColor: Colors.greenAccent,
                ),
                iconColor: Colors.redAccent,
                hintText: 'Yapılacak görev',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
