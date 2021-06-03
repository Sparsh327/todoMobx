import 'package:firstapp/store/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
   final FormStore store = FormStore();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Form(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: <Widget>[
                Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.name = value,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Pick a username',
                      errorText: store.error.username),
                ),
              ),
              Observer(
                  builder: (_) => AnimatedOpacity(
                      child: const LinearProgressIndicator(),
                      duration: const Duration(milliseconds: 300),
                      opacity: store.isUserCheckPending ? 1 : 0)),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.email = value,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      errorText: store.error.email),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.password = value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Set a password',
                      errorText: store.error.password),
                ),
              ),
                ElevatedButton(
                child: const Text('Sign up'),
                onPressed:store.validateAll,
              )
             ],),
         ),
       ),
    );
  }
}