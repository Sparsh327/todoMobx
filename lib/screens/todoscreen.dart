import 'package:firstapp/screens/todopage.dart';
import 'package:flutter/material.dart';

class TodoLis extends StatelessWidget {
  const TodoLis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoPage()));
      }, child: Text("Todo")),),
    );
  }
}