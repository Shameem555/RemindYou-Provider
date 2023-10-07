import 'package:reminder/model/data_model.dart';

List<dynamic> birthday = [];
List<dynamic> wedding = []; 
List<dynamic> engagement = [];
List<dynamic> anniversary = [];
List<dynamic> houseWarming = [];
List<dynamic> others = [];

dynamic bdy = 0;
dynamic wdd= 0;
dynamic eng = 0;
dynamic ann = 0;
dynamic hw = 0;
dynamic or = 0;

allList({var name,required List<EventModel> alldatalist,}){
//seperate variables ..
  
  int One = 0;
  int Two = 0;
  int Three = 0;
  int Four = 0;
  int Five = 0;
  int Six = 0;

  print(alldatalist.map((e) => e.catogory.toString()).toList());
  alldatalist.forEach((e) {
    if ('1' == e.catogory.toString()) {
      One = 1 ;
      birthday.add(One.toString());
      bdy = birthday.length;
      //ChartData(name, bdy.length.toInt());

  print('One${birthday.length.toString()}');
    }else if('2'== e.catogory.toString()){
      Two = 1;
      wedding.add(One.toString());
      wdd = wedding.length;
      //ChartData(name, wdd.length.toInt());

      print("Two${wedding.length.toString()}");
    }else if('3'== e.catogory.toString()){
      Three = 1;
      engagement.add(One.toString());
      eng = engagement.length;
      //ChartData(name, eng.length.toInt());

      print("Three${engagement.length.toString()}");
    }else if('4'== e.catogory.toString()){
      Four = 1;
      anniversary.add(One.toString());
      ann = anniversary.length;
      //ChartData(name, ann.length.toInt());

      print("Four${anniversary.length.toString()}");
    }else if('5'== e.catogory.toString()){
      Five= 1;
      houseWarming.add(One.toString());
      hw = houseWarming.length;
     // ChartData(name, hw.length.toInt());

      print("Five${houseWarming.length.toString()}");
    }else if('6'== e.catogory.toString()){
      Six= 1;
      others.add(One.toString());
      or = others.length;
      //ChartData(name, or.length.toInt());

      print("Six${others.length.toString()}");
    }
    birthday.map((e) => print('name_all${e.toString()}'));
  });
}

historyofdata(){
  
}