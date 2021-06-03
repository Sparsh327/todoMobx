
import 'package:firstapp/store/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final counter = Counter();

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
             Observer(
              builder: (_) => Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ),
           
            ElevatedButton(onPressed: (){counter.increment();
            }, child:Icon(Icons.add))
          ],
        ),
      ),
      // This traili,
    );
  }
}