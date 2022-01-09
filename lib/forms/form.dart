import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // properties: name, age, email, phone
  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController emailController;
  TextEditingController phoneController;

  AppForm(
      {Key? key,
      required this.formKey,
      required this.nameController,
      required this.ageController,
      required this.emailController,
      required this.phoneController})
      : super(key: key);

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  // validasi form
  String? _validateName(String? value) {
    if (value!.length < 6) return 'Nama minimal ditulis 6 karakter';
    return null;
  }

  String? _validateNumber(String? value) {
    String pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!)) return 'Harus diisi dengan angka!';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Tuliskan nama di sini'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Tuliskan usia di sini'),
            validator: _validateNumber,
          ),
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Tuliskan E-Mail di sini'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Tuliskan E-Mail di sini'),
            validator: _validateNumber,
          ),
        ],
      ),
    );
  }
}
