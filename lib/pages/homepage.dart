import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webapi/model/nameprefix.dart';
import 'package:flutter_webapi/model/student.dart';
import 'package:flutter_webapi/pages/detailspage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
   * Flutter menyediakan Widget yang digunakan untuk komunikasi
   * dengan Web API yang disebut dengan Future.
   * 
   * Flutter harus mengenali dahulu, data yang ingin ditampilkan berisi apa saja.
   * - Desing patterna MVC: Model digunakan untuk menghandle database.
   */

  late Future<List<Student>> students;
  final studentListKey = GlobalKey<_HomePageState>();

  void initState() {
    super.initState();
    students = getStudentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentListKey,
      appBar: AppBar(title: Text('Student List')),
      body: Center(
        child: FutureBuilder<List<Student>>(
          future: students,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            // data
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  var data = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.list_outlined),
                      title: Text(
                        data.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(student: data)));
                      },
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }

  Future<List<Student>> getStudentList() async {
    final url = '${NamePrefix.URL_PREFIX}/list.php';
    final response = await http.get(Uri.parse(url));

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    // print(items);

    List<Student> students = items.map<Student>((json) {
      return Student.fromJson(json);
    }).toList();

    return students;
  }
}
