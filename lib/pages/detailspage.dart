import 'package:flutter/material.dart';
import 'package:flutter_webapi/model/student.dart';

import 'editpage.dart';

class DetailsPage extends StatefulWidget {
  late final Student student;

  DetailsPage({required this.student});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EditPage(student: widget.student);
          }));
        },
        child: Icon(Icons.edit),
      ),
      body: Container(
        height: 280.0,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // isi dari details student: name, age, email, phone
            Text(
              "Name : ${widget.student.name}",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
            Text(
              "Age : ${widget.student.age}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
            Text(
              "Email : ${widget.student.email}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
            Text(
              "Phone : ${widget.student.phone}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
