import 'dart:ffi';

import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/screenAll.dart';

List<dynamic> birthday = [];
List<dynamic> wedding = []; 
List<dynamic> engagement = [];
List<dynamic> anniversary = [];
List<dynamic> houseWarming = [];
List<dynamic> others = [];


dynamic One = 0;
  dynamic Two = 0;
  dynamic Three = 0;
  dynamic Four = 0;
  dynamic Five = 0;
  dynamic Six = 0;

allList({var name,required List<EventModel> alldatalist,}){
//seperate variables ..
  
  

  print(alldatalist.map((e) => e.catogory.toString()).toList());
  alldatalist.forEach((e) {
    if ('1' == e.catogory.toString()) {
      One++;
     // birthday.add(One.toString());
      //bdy = birthday.length;
      //historyofdata(brth: bdy);
      //ChartData(name, bdy.length.toInt());
      //historyofdata(brth: bdy);

  //print('One${birthday.length.toString()}');
    }else if('2'== e.catogory.toString()){
      Two++;
      //wedding.add(One.toString());
      //wdd = wedding.length;
      //historyofdata(brth: bdy);
      //ChartData(name, wdd.length.toInt());
      //historyofdata(wedd: wdd);

      //print("Two${wedding.length.toString()}");
    }else if('3'== e.catogory.toString()){
      Three++;
      //engagement.add(One.toString());
      //eng = engagement.length;
      //historyofdata(brth: bdy);
      //ChartData(name, eng.length.toInt());
      //historyofdata(engage: eng);

      //print("Three${engagement.length.toString()}");
    }else if('4'== e.catogory.toString()){
      Four++;
      //anniversary.add(One.toString());
      //ann = anniversary.length;
      //historyofdata(brth: bdy);
      //ChartData(name, ann.length.toInt());
      //historyofdata(anni: ann);

      //print("Four${anniversary.length.toString()}");
    }else if('5'== e.catogory.toString()){
      Five++;
      //houseWarming.add(One.toString());
      //hw = houseWarming.length;
      //historyofdata(brth: bdy);
      //ChartData(name, hw.length.toInt());
      //historyofdata(warm: hw);

      //print("Five${houseWarming.length.toString()}");
    }else if('6'== e.catogory.toString()){
      Six++;
      //others.add(One.toString());
      //or = others.length;
      //historyofdata(brth: bdy);
      //ChartData(name, or.length.toInt());
      //historyofdata(otr: or);

      //print("Six${others.length.toString()}");
    }
    birthday.map((e) => print('name_all${e.toString()}'));
  });
}

historyofdata({var brth}){
 List<dynamic>evendata = [];
 evendata.add(brth.toString());
 print('print<-------->${evendata.map((e) => e.toString())}');

}

chartprint(){
  // print('One${One.toString()}');
  // print('Two${Two.toString()}');
  // print('Three${Three.toString()}');
  // print('Four${Four.toString()}');
  // print('Five${Five.toString()}');
  // print('Six${Six.toString()}');
  //object
  //final localchart = ChartScreenAll(bdy: One,wdd: Two,eng: Three,ann: Four,hw: Five,or: Six,);
//Eventchart(B: One,W: Two,E: Three,A: Four,H: Five,O: Six);
final his= Eventchart(B: One,W: Two,E: Three,A: Four,H: Five,O: Six);
Eventchart.birthday.add(One.toString());
Eventchart.wedding.add(Two.toString());
Eventchart.engagement.add(Three.toString());
Eventchart.anniversary.add(Four.toString());
Eventchart.houseWarming.add(Five.toString());
Eventchart.others.add(Six.toString());
print(One.toString());
}
