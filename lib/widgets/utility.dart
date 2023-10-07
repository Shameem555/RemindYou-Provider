import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/screenAll.dart';

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
      historyofdata(brth: bdy);
      //ChartData(name, bdy.length.toInt());
      //historyofdata(brth: bdy);

  print('One${birthday.length.toString()}');
    }else if('2'== e.catogory.toString()){
      Two = 1;
      wedding.add(One.toString());
      wdd = wedding.length;
      historyofdata(brth: bdy);
      //ChartData(name, wdd.length.toInt());
      //historyofdata(wedd: wdd);

      print("Two${wedding.length.toString()}");
    }else if('3'== e.catogory.toString()){
      Three = 1;
      engagement.add(One.toString());
      eng = engagement.length;
      historyofdata(brth: bdy);
      //ChartData(name, eng.length.toInt());
      //historyofdata(engage: eng);

      print("Three${engagement.length.toString()}");
    }else if('4'== e.catogory.toString()){
      Four = 1;
      anniversary.add(One.toString());
      ann = anniversary.length;
      historyofdata(brth: bdy);
      //ChartData(name, ann.length.toInt());
      //historyofdata(anni: ann);

      print("Four${anniversary.length.toString()}");
    }else if('5'== e.catogory.toString()){
      Five= 1;
      houseWarming.add(One.toString());
      hw = houseWarming.length;
      historyofdata(brth: bdy);
     // ChartData(name, hw.length.toInt());
     //historyofdata(warm: hw);

      print("Five${houseWarming.length.toString()}");
    }else if('6'== e.catogory.toString()){
      Six= 1;
      others.add(One.toString());
      or = others.length;
      historyofdata(brth: bdy);
      //ChartData(name, or.length.toInt());
      //historyofdata(otr: or);

      print("Six${others.length.toString()}");
    }
    birthday.map((e) => print('name_all${e.toString()}'));
  });
}

historyofdata({var brth}){
 List<dynamic>evendata = [];
 evendata.add(brth.toString());
 print('print<-------->${evendata.map((e) => e.toString())}');

}