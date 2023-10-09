// import 'package:reminder/model/data_model.dart';

// List<dynamic> birthday = [];
// List<dynamic> wedding = []; 
// List<dynamic> engagement = [];
// List<dynamic> anniversary = [];
// List<dynamic> houseWarming = [];
// List<dynamic> others = [];


//   dynamic One = 0;
//   dynamic Two = 0;
//   dynamic Three = 0;
//   dynamic Four = 0;
//   dynamic Five = 0;
//   dynamic Six = 0;

// allList({var name,required List<EventModel> alldatalist,}){
// //seperate variables ..
  
//   print(alldatalist.map((e) => e.catogory.toString()).toList());
//   // ignore: avoid_function_literals_in_foreach_calls
//   alldatalist.forEach((e) {
//     if ('1' == e.catogory.toString()) {
//       One = 1;
//       birthday.add(One.toString());

//       print('One${birthday.length.toString()}');

//     }else if('2'== e.catogory.toString()){
//       Two =1;
//       wedding.add(One.toString());

//       print("Two${wedding.length.toString()}");

//     }else if('3'== e.catogory.toString()){
//       Three = 1;
//       engagement.add(One.toString());
      
//       print("Three${engagement.length.toString()}");

//     }else if('4'== e.catogory.toString()){
//       Four = 1;
//       anniversary.add(One.toString());

//       print("Four${anniversary.length.toString()}");

//     }else if('5'== e.catogory.toString()){
//       Five = 1;
//       houseWarming.add(One.toString());
      
//       print("Five${houseWarming.length.toString()}");

//     }else if('6'== e.catogory.toString()){
//       Six++;
//       others.add(One.toString());
      
//       print("Six${others.length.toString()}");
//     }
//     birthday.map((e) => print('name_all${e.toString()}'));
//   });
// }



// ////////1////////////
// historyofall(){
//   birthdays.clear();
//   weddings.clear();
//   engagements.clear();
//   anniversarys.clear();
//   houseWarmings.clear();
//   otherss.clear();
// /////////2///////////
//   birthdayy.clear();
//   weddingy.clear();
//   engagementy.clear();
//   anniversaryy.clear();
//   houseWarmingy.clear();
//   othersy.clear();
//  ///////3/////////////
//   birthday.clear();
//   wedding.clear();
//   engagement.clear();
//   anniversary.clear();  
//   houseWarming.clear();
//   others.clear();
// }

// ////////////today data ///////
// List<dynamic> birthdays =[];
// List<dynamic> weddings =[];
// List<dynamic> engagements =[];
// List<dynamic> anniversarys =[];
// List<dynamic> houseWarmings =[];
// List<dynamic> otherss =[];

// class todayscreenchart {
//   DateTime today = DateTime.now();
//   List<dynamic>listofdata =[];

//   dynamic Ones = 0;
//   dynamic Twos = 0;
//   dynamic Threes = 0;
//   dynamic Fours = 0;
//   dynamic Fives = 0;
//   dynamic Sixs = 0;

//   todayList({var name, required List<EventModel> alldatalist}){
//     alldatalist.forEach((e) {
//       if (today.toString().substring(0, 11) == 
//       e.dateTime.toString().substring(0, 11)) {
//         One = 1;
//         listofdata.add(e.catogory.toString());
//       }
//     });
//   }
//   checkconditions(){
//     print("------------>${listofdata.map((e) => e.toString()).toList()}");
//     listofdata.forEach((e) {
//       if ("1" == e.toString()) {
//         Ones = 1;
//         birthdays.add(Ones.toString());
//         print("one======>${listofdata.map((e) => e.toString()).toString()}");
//       }

//       if ("2" == e.toString()) {
//         Twos =1;
//         weddings.add(Twos.toString());
//         print("two=====>${weddings.length}");
//       }

//       if ("3"== e.toString()) {
//         Threes =1;
//         engagements.add(Threes.toString());
//         print("three====>${engagements.length}");
//       }

//       if ("4"== e.toString()) {
//         Fours =1;
//         engagements.add(Fours.toString());
//         print("four====>${engagements.length}");
//       }

//       if ("5"== e.toString()) {
//         Fives =1;
//         engagements.add(Fives.toString());
//         print("five====>${engagements.length}");
//       }
//     });
//   }
//   historyoftoday() {
//     birthday.clear();
//     wedding.clear();
//     engagement.clear();
//     anniversary.clear();
//     houseWarming.clear();
//     others.clear();
// ///////////////////////
//     birthdayy.clear();
//     weddingy.clear();
//     engagementy.clear();
//     anniversaryy.clear();
//     houseWarmingy.clear();
//     othersy.clear();
//   }
// }

// ///Yesterday data////////////////

// List<dynamic> birthdayy = [];
// List<dynamic> weddingy = [];
// List<dynamic> engagementy = [];
// List<dynamic> anniversaryy = [];
// List<dynamic> houseWarmingy = [];
// List<dynamic> othersy = [];

// class yesterday_screenchart {
//   DateTime yestarday = DateTime.now().subtract(Duration(days: 1));
//   List<dynamic> listsofdatass = [];

//   dynamic Oney = 0;
//   dynamic Twoy = 0;
//   dynamic Threey = 0;
//   dynamic Foury = 0;
//   dynamic Fivey = 0;
//   dynamic Sixy = 0;

//   yesterdayList({
//     var name,
//     required List<EventModel> alldatalist,
//   }) {
//     alldatalist.forEach((e) {
//       if (yestarday.toString().substring(0, 11) ==
//           e.dateTime.toString().substring(0, 11)) {
//         listsofdatass.add(e.catogory.toString());
//       }
//     });
//   }
//   checkconditions() {
//     print("----------->${listsofdatass.map((e) => e.toString()).toList()}");
//     listsofdatass.forEach((e) {
//       if ("1" == e.toString()) {
//         Oney = 1;
//         birthdayy.add(Oney.toString());
//         print("one======${birthdayy.length}");
//       }
//       if ("2" == e.toString()) {
//         Twoy = 1;
//         weddingy.add(Twoy.toString());
//         print("two======${weddingy.length}");
//       }
//       if ("3" == e.toString()) {
//         Threey = 1;
//         engagementy.add(Threey.toString());
//         print("three======${engagementy.length}");
//       }
//       if ("4" == e.toString()) {
//         Foury = 1;
//         anniversaryy.add(Foury.toString());
//         print("four======${anniversaryy.length}");
//       }
//       if ("5" == e.toString()) {
//         Fivey = 1;
//         houseWarmingy.add(Fivey.toString());
//         print("five======${houseWarmingy.length}");
//       }
//       if ("6" == e.toString()) {
//         Sixy = 1;
//         othersy.add(Sixy.toString());
//         print("six======${othersy.length}");
//       }
//     });
//   }
//   historyofyestarday() {
//     birthday.clear();
//     weddingy.clear();
//     engagement.clear();
//     anniversary.clear();
//     houseWarming.clear();
//     others.clear();
// ///////////////////////////
//     birthdays.clear();
//     weddings.clear();
//     engagements.clear();
//     anniversarys.clear();
//     houseWarmings.clear();
//     otherss.clear();
//   }
// }
//////////////////////////////////////////////////////////my code reference/////////////////////////

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:reminder/model/data_model.dart';

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

allList({
  var name,
  required List<EventModel> alldatalist,
}) {
//seperate variables ..

  print(alldatalist.map((e) => e.catogory.toString()).toList());
  // ignore: avoid_function_literals_in_foreach_calls
  alldatalist.forEach((e) {
    if ('1' == e.catogory.toString()) {
      One = 1;
      birthday.add(One.toString());

      print('One${birthday.length.toString()}');
    } else if ('2' == e.catogory.toString()) {
      Two = 1;
      wedding.add(One.toString());

      print("Two${wedding.length.toString()}");
    } else if ('3' == e.catogory.toString()) {
      Three = 1;
      engagement.add(One.toString());

      print("Three${engagement.length.toString()}");
    } else if ('4' == e.catogory.toString()) {
      Four = 1;
      anniversary.add(One.toString());

      print("Four${anniversary.length.toString()}");
    } else if ('5' == e.catogory.toString()) {
      Five = 1;
      houseWarming.add(One.toString());

      print("Five${houseWarming.length.toString()}");
    } else if ('6' == e.catogory.toString()) {
      Six++;
      others.add(One.toString());

      print("Six${others.length.toString()}");
    }
    birthday.map((e) => print('name_all${e.toString()}'));
  });
}

historyofall() {
  birthdays.clear();
  weddings.clear();
  engagements.clear();
  anniversarys.clear();
  houseWarmings.clear();
  otherss.clear();
///////////////////////////
  birthdayy.clear();
  weddingy.clear();
  engagementy.clear();
  anniversaryy.clear();
  houseWarmingy.clear();
  othersy.clear();
  /////////////////////////////
   birthday.clear();
    wedding.clear();
    engagement.clear();
    anniversary.clear();
    houseWarming.clear();
    others.clear();
}

///////////////////////////today data a/////////////////////////////////////////////////////////////////////////////////
List<dynamic> birthdays = [];
List<dynamic> weddings = [];
List<dynamic> engagements = [];
List<dynamic> anniversarys = [];
List<dynamic> houseWarmings = [];
List<dynamic> otherss = [];

class todayscreenchart {
  DateTime today = DateTime.now();
// datae  datetoday = today.toString().substring(0, 11);
  List<dynamic> listsofdata = [];

  dynamic Ones = 0;
  dynamic Twos = 0;
  dynamic Threes = 0;
  dynamic Fours = 0;
  dynamic Fives = 0;
  dynamic Sixs = 0;

  todayList({
    var name,
    required List<EventModel> alldatalist,
  }) {
    alldatalist.forEach((e) {
      if (today.toString().substring(0, 11) ==
          e.dateTime.toString().substring(0, 11)) {
        One = 1;
        listsofdata.add(e.catogory.toString());
      }

      // birthday.map((e) => print('name_all${e.toString()}'));
    });
  }

  checkconditions() {
    print("----------->${listsofdata.map((e) => e.toString()).toList()}");
    listsofdata.forEach((e) {
      if ("1" == e.toString()) {
        Ones = 1;
        birthdays.add(Ones.toString());
        print("one======${birthdays.length}");
        
      }
      if ("2" == e.toString()) {
        Twos = 1;
        weddings.add(Twos.toString());
        print("two======${weddings.length}");
      }
      if ("3" == e.toString()) {
        Threes = 1;
        engagements.add(Threes.toString());
        print("three======${engagements.length}");
      }
      if ("4" == e.toString()) {
        Fours = 1;
        anniversarys.add(Fours.toString());
        print("four======${anniversary.length}");
      }
      if ("5" == e.toString()) {
        Fives = 1;
        houseWarmings.add(Fives.toString());
        print("five======${houseWarmings.length}");
      }
      if ("6" == e.toString()) {
        Sixs = 1;
        others.add(Sixs.toString());
        print("six======${others.length}");
      }
    });
  }

  historyoftoday() {
    birthday.clear();
    wedding.clear();
    engagement.clear();
    anniversary.clear();
    houseWarming.clear();
    others.clear();
///////////////////////////
    birthdayy.clear();
    weddingy.clear();
    engagementy.clear();
    anniversaryy.clear();
    houseWarmingy.clear();
    othersy.clear();
  }
}

//////////////////////////////////yesterday data ///////////////////////////////////////////////////////////////////////

List<dynamic> birthdayy = [];
List<dynamic> weddingy = [];
List<dynamic> engagementy = [];
List<dynamic> anniversaryy = [];
List<dynamic> houseWarmingy = [];
List<dynamic> othersy = [];

class yesterday_screenchart {
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  List<dynamic> listsofdatass = [];

  dynamic Oney = 0;
  dynamic Twoy = 0;
  dynamic Threey = 0;
  dynamic Foury = 0;
  dynamic Fivey = 0;
  dynamic Sixy = 0;

  yesterdayList({
    var name,
    required List<EventModel> alldatalist,
  }) {
    alldatalist.forEach((e) {
      if (yesterday.toString().substring(0, 11) ==
          e.dateTime.toString().substring(0, 11)) {
        // One = 1;
        listsofdatass.add(e.catogory.toString());
      }

      // birthday.map((e) => print('name_all${e.toString()}'));
    });
  }

  checkconditions() {
    print("----------->${listsofdatass.map((e) => e.toString()).toList()}");
    // ignore: avoid_function_literals_in_foreach_calls
    listsofdatass.forEach((e) {
      if ("1" == e.toString()) {
        Oney = 1;
        birthdayy.add(Oney.toString());
        print("one======${birthdayy.length}");
      }
      if ("2" == e.toString()) {
        Twoy = 1;
        weddingy.add(Twoy.toString());
        print("two======${weddingy.length}");
      }
      if ("3" == e.toString()) {
        Threey = 1;
        engagementy.add(Threey.toString());
        print("three======${engagementy.length}");
      }
      if ("4" == e.toString()) {
        Foury = 1;
        anniversaryy.add(Foury.toString());
        print("four======${anniversaryy.length}");
      }
      if ("5" == e.toString()) {
        Fivey = 1;
        houseWarmingy.add(Fivey.toString());
        print("five======${houseWarmingy.length}");
      }
      if ("6" == e.toString()) {
        Sixy = 1;
        othersy.add(Sixy.toString());
        print("six======${othersy.length}");
      }
    });
  }

  historyofyesterday() {
    birthday.clear();
    weddingy.clear();
    engagement.clear();
    anniversary.clear();
    houseWarming.clear();
    others.clear();
///////////////////////////
    birthdays.clear();
    weddings.clear();
    engagements.clear();
    anniversarys.clear();
    houseWarmings.clear();
    otherss.clear();
  }
}

