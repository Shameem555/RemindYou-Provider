import 'package:reminder/model/data_model.dart';

List<dynamic> birthday = [];
List<dynamic> wedding = []; 
List<dynamic> engagement = [];
List<dynamic> anniversary = [];
List<dynamic> houseWarming = [];
List<dynamic> others = [];

Map<String, int> count(List<EventModel> chartHistory, String desiredCategory) {
  Map<String, int> categoryCounts = {
    'Birthday': 0,
    'Wedding': 0,
    'Engagement': 0,
    'House Warming': 0,
    'Anniversary': 0,
    'others': 0,
  };

  for (var i = 0; i < chartHistory.length; i++) {
    if (chartHistory[i].catogory == desiredCategory) {
      categoryCounts[desiredCategory];
    }
  }

  return categoryCounts;
}

allList({required List<EventModel> alldatalist}){
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
  print('One${birthday.length.toString()}');
    }else if('2'== e.catogory.toString()){
      Two = 1;
      wedding.add(One.toString());
      print("Two${wedding.length.toString()}");
    }else if('3'== e.catogory.toString()){
      Three = 1;
      engagement.add(One.toString());
      print("Three${engagement.length.toString()}");
    }else if('4'== e.catogory.toString()){
      Four = 1;
      anniversary.add(One.toString());
      print("Four${anniversary.length.toString()}");
    }else if('5'== e.catogory.toString()){
      Five= 1;
      houseWarming.add(One.toString());
      print("Five${houseWarming.length.toString()}");
    }else if('6'== e.catogory.toString()){
      Six= 1;
      others.add(One.toString());
      print("Six${others.length.toString()}");
    }
  });
}
