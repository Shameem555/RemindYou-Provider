import 'package:flutter/material.dart';
import 'package:reminder/model/data_model.dart';

class UtiilityProvider extends ChangeNotifier{
  
}

List<dynamic> birthday    = [];
List<dynamic> wedding     = [];
List<dynamic> engagement  = [];
List<dynamic> anniversary = [];
List<dynamic> houseWarming= [];
List<dynamic> others      = [];

dynamic one  = 0;
dynamic two  = 0;
dynamic three= 0;
dynamic four = 0;
dynamic five = 0;
dynamic six  = 0; 

allList({ var name, required List<EventModel> alldatalist}) {

  // ignore: avoid_print
  print(alldatalist.map((e) => e.catogory.toString()).toList());

  // ignore: avoid_function_literals_in_foreach_calls
  alldatalist.forEach((e) {
    if ('1' == e.catogory.toString()) {
      one = 1;
      birthday.add(one.toString());
      // ignore: avoid_print
      print('one${birthday.length.toString()}');

    } else if ('2' == e.catogory.toString()) {
      two = 1;
      wedding.add(one.toString());
      // ignore: avoid_print
      print("two${wedding.length.toString()}");

    } else if ('3' == e.catogory.toString()) {
      three = 1;
      engagement.add(one.toString());
      // ignore: avoid_print
      print("three${engagement.length.toString()}");

    } else if ('4' == e.catogory.toString()) {
      four = 1;
      anniversary.add(one.toString());
      // ignore: avoid_print
      print("four${anniversary.length.toString()}");

    } else if ('5' == e.catogory.toString()) {
      five = 1;
      houseWarming.add(one.toString());
      // ignore: avoid_print
      print("five${houseWarming.length.toString()}");

    } else if ('6' == e.catogory.toString()) {
      six++;
      others.add(one.toString());
      // ignore: avoid_print
      print("six${others.length.toString()}");

    }
    // ignore: avoid_print
    birthday.map((e) => print('name_all${e.toString()}'));
  });
}

//>>------------------------------->today data <----------------------------------------------<<\\
List<dynamic> birthdays     = [];
List<dynamic> weddings      = [];
List<dynamic> engagements   = [];
List<dynamic> anniversarys  = [];
List<dynamic> houseWarmings = [];
List<dynamic> otherss       = [];

// ignore: camel_case_types
class todayscreenchart {
  DateTime today = DateTime.now();

  List<dynamic> listsofdata = [];

  dynamic ones   = 0;
  dynamic twos   = 0;
  dynamic threes = 0;
  dynamic fours  = 0;
  dynamic fives  = 0;
  dynamic sixs   = 0;

  todayList({
    var name,
    required List<EventModel> alldatalist,
  }) {
    // ignore: avoid_function_literals_in_foreach_calls
    alldatalist.forEach((e) {
      if (today.toString().substring(0, 11) ==
          e.dateTime.toString().substring(0, 11)) {
        one = 1;
        listsofdata.add(e.catogory.toString());
      }
    });
  }

  checkconditions() {
    //print("----------->${listsofdata.map((e) => e.toString()).toList()}");
    // ignore: avoid_function_literals_in_foreach_calls
    listsofdata.forEach((e) {
      if ("1" == e.toString()) {
        ones = 1;
        birthdays.add(ones.toString());
        //print("one======${birthdays.length}");
        
      }
      if ("2" == e.toString()) {
        twos = 1;
        weddings.add(twos.toString());
        //print("two======${weddings.length}");

      }
      if ("3" == e.toString()) {
        threes = 1;
        engagements.add(threes.toString());
        //print("three======${engagements.length}");

      }
      if ("4" == e.toString()) {
        fours = 1;
        anniversarys.add(fours.toString());
        //print("four======${anniversary.length}");

      }
      if ("5" == e.toString()) {
        fives = 1;
        houseWarmings.add(fives.toString());
        //print("five======${houseWarmings.length}");

      }
      if ("6" == e.toString()) {
        sixs = 1;
        others.add(sixs.toString());
        //print("six======${others.length}");

      }
    });
  }
}

//<-------------------------------->yesterday data<---------------------------------------------->\\

List<dynamic> birthdayy    =[];
List<dynamic> weddingy     =[];
List<dynamic> engagementy  =[];
List<dynamic> anniversaryy =[];
List<dynamic> houseWarmingy=[];
List<dynamic> othersy      =[];

// ignore: camel_case_types
class yesterday_screenchart {
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  List<dynamic> listsofdatass = [];

  dynamic oney  =0;
  dynamic twoy  =0;
  dynamic threey=0;
  dynamic foury =0;
  dynamic fivey =0;
  dynamic sixy  =0;

  yesterdayList({
    var name,
    required List<EventModel> alldatalist,
  }) {
    // ignore: avoid_function_literals_in_foreach_calls
    alldatalist.forEach((e) {
      if (yesterday.toString().substring(0, 11) ==
          e.dateTime.toString().substring(0, 11)) {
        listsofdatass.add(e.catogory.toString());
      }
    });
  }

  checkconditions() {
    //print("----------->${listsofdatass.map((e) => e.toString()).toList()}");
    // ignore: avoid_function_literals_in_foreach_calls
    listsofdatass.forEach((e) {
      if ("1" == e.toString()) {
        oney = 1;
        birthdayy.add(oney.toString());
        //print("one======${birthdayy.length}");
      }

      if ("2" == e.toString()) {
        twoy = 1;
        weddingy.add(twoy.toString());
        //print("two======${weddingy.length}");
      }

      if ("3" == e.toString()) {
        threey = 1;
        engagementy.add(threey.toString());
        //print("three======${engagementy.length}");
      }

      if ("4" == e.toString()) {
        foury = 1;
        anniversaryy.add(foury.toString());
        //print("four======${anniversaryy.length}");
      }

      if ("5" == e.toString()) {
        fivey = 1;
        houseWarmingy.add(fivey.toString());
        //print("five======${houseWarmingy.length}");

      }

      if ("6" == e.toString()) {
        sixy = 1;
        othersy.add(sixy.toString());
        //print("six======${othersy.length}");
      }
    });
  }
}

