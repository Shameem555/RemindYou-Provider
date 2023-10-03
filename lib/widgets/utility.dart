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
