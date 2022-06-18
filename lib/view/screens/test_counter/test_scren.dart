import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:ecommerce_flutter/providers/counter_test_provider/counter_test_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
    create: (context)=> CounterProvider(),
    child: Scaffold(
    floatingActionButton: Consumer<CounterProvider>(builder: (context,counter,child){
    return FloatingActionButton(
    onPressed: (){
    counter.changeCounters();
    },
    child: Icon(Icons.add),
    );
    }),
    body: Center(
    child: Consumer<CounterProvider>(builder: (context,provider,child){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        child: Center(
        child: Text('Counter value now: ${provider.counter1}',style: textStyleNormal.copyWith(fontSize: 30),),
        ),
        ),
        Container(
        child: Center(
        child: Text('Counter value now: ${provider.counter2}',style: textStyleNormal.copyWith(fontSize: 30),),
        ),
        ),
      ],
    );
    }),),
    ),

    );
  }
}

