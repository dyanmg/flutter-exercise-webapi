import 'package:flutter/material.dart';
import 'package:flutter_webapi/forms/form.dart';
import 'package:flutter_webapi/model/nameprefix.dart';
import 'package:flutter_webapi/model/student.dart';

import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  final Student student;

  const EditPage({Key? key, required this.student}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();

  // properties
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  Future editStudent() async {
    final url = '${NamePrefix.URL_PREFIX}/update.php';
    return await http.post(
      Uri.parse(url),
      body: {
        'id': widget.student.id.toString(),
        'name': nameController.text,
        'age': ageController.text,
        'email': emailController.text,
        'phone': phoneController.text,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    ageController = TextEditingController(text: widget.student.age.toString());
    emailController = TextEditingController(text: widget.student.email);
    phoneController = TextEditingController(text: widget.student.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: AppForm(
              formKey: formKey,
              nameController: nameController,
              ageController: ageController,
              emailController: emailController,
              phoneController: phoneController),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              _updateStudent(context);
            }
          },
          child: Text('Update'),
        ),
      ),
    );
  }

  void _updateStudent(context) async {
    await editStudent();

    // redirect
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
