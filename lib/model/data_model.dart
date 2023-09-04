import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class EventModel extends HiveObject{

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String catogory;
  @HiveField(2)
  DateTime dateTime;
  @HiveField(3)
  dynamic timeOfDay;

  EventModel({
    required this.title, required this.catogory, required this.dateTime, required this.timeOfDay,
    });
  
}