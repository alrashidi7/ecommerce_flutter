import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

  int counter1 =5;
  int counter2 = 10;

  changeCounters(){
    if(counter1==0){

    }else{

      counter1--;
    }
    if(counter2==0){

    }else{

      counter2--;
    }
    notifyListeners();
  }

}