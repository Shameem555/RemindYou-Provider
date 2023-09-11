// import 'package:flutter/material.dart';
// import 'package:reminder/functions/events_db.dart';
// import 'package:reminder/model/data_model.dart';
// import 'package:reminder/screen/addEvent.dart';

// class ListScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.blue[300],
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//         title: const Text(" Events List",style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//           ),),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddEvent(),),);
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Container(
//               height: 55,
//               width: 360,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white),
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         hintText: 'Search',
//                         hintStyle: TextStyle(fontSize: 20),
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.search_rounded),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: eventListNotifier,
//                 builder: (BuildContext ctx,
//                 List<EventModel>eventList, Widget? child){
//                   return SingleChildScrollView(
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         final data = eventList[index];
//                         return ListTile(
//                           title: Text(data.title,style: const TextStyle(color: Colors.white),),
//                           //subtitle: Text(data.timeOfDay),
//                           //trailing: Text(data.dateTime as String),
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return const Divider();
//                       },
//                       itemCount: eventList.length,
//                     ),
//                   );
//                 }
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
/////////////////////////////////////////////<working_code_one>\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

// import 'package:flutter/material.dart';
// import 'package:reminder/functions/events_db.dart';
// import 'package:reminder/model/data_model.dart';
// import 'package:reminder/subscreen/editscreen.dart';


// //list show aakan (event screen) after..
// class ListScreen extends StatelessWidget {
//   var leng ; 
//   //var deletevent = EventsDB();

//   List<EventModel> filteredLists = [];
//   bool isSearching = false;

//   @override
//   Widget build(BuildContext context) {
//     //get all event kodukkanam
//     getAllEvent();
//     return ValueListenableBuilder(
//       valueListenable: eventListNotifier,
//       builder: (BuildContext ctx, List<EventModel> eventlist, Widget? child) {
//         List <EventModel> eventList = isSearching ? filteredLists: eventlist;
//         // if (eventList.isEmpty) {
//         //   return 
//         // }
//         return SafeArea(
//           child: Scaffold(
//             backgroundColor: Colors.black,
//             body:
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child:
//               eventList.isEmpty ? const Padding(
//                 padding: EdgeInsets.only(left: 50,top: 100),
//                 child: SizedBox(height: 50,width: 250,child: Center(child: Text("ഇതിൽ ഒന്നും ഇല്ല",style: TextStyle(color: Colors.white,fontSize: 25),),)),
//               ):
//               ListView.separated(
//                 //reverse: true,  
//                 //shrinkWrap: true,
//                 itemBuilder: (ctx, index) {
//                   final data = eventList[index];
//                   return 
                   
//                   Card(
//                     elevation: 2,
//                     child: ListTile(
//                       title: Text(
//                         data.title,
//                         //style: const TextStyle(color: Colors.white),
//                       ),
//                       subtitle: Text(
//                         '${data.dateTime.day}/${data.dateTime.month}/${data.dateTime.year}',
//                         //style: TextStyle(color: Colors.white),
//                       ),
//                       trailing: 
//                       PopupMenuButton(
//                         itemBuilder: (context) => [
//                           PopupMenuItem(
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: TextButton(
//                                     onPressed: () {
//                                       // to edit
//                                       Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               const EditScreen(),
//                                         ),
//                                       );
//                                     },
//                                     child: const Text("Edit"),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           PopupMenuItem(
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: TextButton(
//                                     onPressed: () {
//                                       deleteEvents(index);
//                                       // to delete
//                                       //deletevent.deleteEvents(index);
//                                       // if (eventList.contains(data.title.toString())) {
//                                       //   deletevent.deleteEvents(index);
//                                       // }else{
//                                       //   print("Failed");
//                                       // }
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text('Delete'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                         icon: const Icon(Icons.more_vert_rounded),
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (ctx, index) {
//                   return const SizedBox(
//                     height: 5,
//                   );
//                 },
//                 itemCount: eventList.length,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

///////////////////////////////////ippo wrk aayathanu 2nd, this is important code,ippo varum/////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:reminder/functions/events_db.dart';
// import 'package:reminder/model/data_model.dart';
// import 'package:reminder/subscreen/editscreen.dart';

// class ListScreen extends StatefulWidget {
//   @override
//   _ListScreenState createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';
//   //temporary tio work this
//   List<EventModel> filteredLists = [];
//   bool isSearching = false;

//   @override
//   Widget build(BuildContext context) {
//     getAllEvent(); // You may need to load your events initially.

//     return ValueListenableBuilder(
//       valueListenable: eventListNotifier,
//       builder: (BuildContext ctx, List<EventModel> eventlist, Widget? child) {
//         List<EventModel> eventList = isSearching
//             ? filteredLists
//             : eventlist.where((event) {
//                 final title = event.title.toLowerCase();
//                 return title.contains(_searchQuery.toLowerCase());
//               }).toList();

//         return SafeArea(
//           child: Scaffold(
//             backgroundColor: Colors.black,
//             body: Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: eventList.isEmpty
//                   ? const Padding(
//                       padding: EdgeInsets.only(left: 50, top: 100),
//                       child: SizedBox(
//                         height: 50,
//                         width: 250,
//                         child: Center(
//                           child: Text(
//                             "ഇതിൽ ഒന്നും ഇല്ല",
//                             style: TextStyle(color: Colors.white, fontSize: 25),
//                           ),
//                         ),
//                       ),
//                     )
//                   : Column(
//                       children: [
//                         Container(
//                           height: 55,
//                           width: 360,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.white,
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: _searchController,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _searchQuery = value;
//                                     });
//                                   },
//                                   decoration: const InputDecoration(
//                                     hintText: 'Search',
//                                     hintStyle: TextStyle(fontSize: 20),
//                                     border: InputBorder.none,
//                                     contentPadding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.search_rounded),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Expanded(
//                           child: ListView.separated(
//                             itemBuilder: (ctx, index) {
//                               final data = eventList[index];
//                               return Card(
//                                 elevation: 2,
//                                 child: ListTile(
//                                   title: Text(data.title),
//                                   subtitle: Text(
//                                       '${data.dateTime.day}/${data.dateTime.month}/${data.dateTime.year}'),
//                                   trailing: PopupMenuButton(
//                                     itemBuilder: (context) => [
//                                       PopupMenuItem(
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.only(left: 10.0),
//                                               child: TextButton(
//                                                 onPressed: () {
//                                                   // to edit
//                                                   Navigator.of(context).push(
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           const EditScreen(),
//                                                     ),
//                                                   );
//                                                 },
//                                                 child: const Text("Edit"),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem(
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.only(left: 10.0),
//                                               child: TextButton(
//                                                 onPressed: () {
//                                                   deleteEvents(index);
//                                                   Navigator.of(context).pop();
//                                                 },
//                                                 child: const Text('Delete'),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                     icon: const Icon(Icons.more_vert_rounded),
//                                   ),
//                                 ),
//                               );
//                             },
//                             separatorBuilder: (ctx, index) {
//                               return const SizedBox(
//                                 height: 5,
//                               );
//                             },
//                             itemCount: eventList.length,
//                           ),
//                         ),
//                       ],
//                     ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// this is a working code, there is a small issue when we search..
//thazhathe kode set aa kalayanda///

import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/subscreen/editscreen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<EventModel> filteredLists = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    getAllEvent(); // You may need to load your events initially.

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SearchField(
                controller: _searchController,
                onSearch: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: eventListNotifier,
                  builder: (BuildContext ctx, List<EventModel> eventlist, Widget? child) {
                    List<EventModel> eventList = isSearching
                        ? filteredLists
                        : eventlist.where((event) {
                            final title = event.title.toLowerCase();
                            return title.contains(_searchQuery.toLowerCase());
                          }).toList();

                    if (eventList.isEmpty) {
                      return const Center(
                        child: Text(
                          "ഇതിൽ ഒന്നും ഇല്ല",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      );
                    }
                    return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = eventList[index];
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(data.title),
                            subtitle: Text(
                                '${data.dateTime.day}/${data.dateTime.month}/${data.dateTime.year}'),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: TextButton(
                                          onPressed: () {
                                            // to edit
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text("Edit"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: TextButton(
                                          onPressed: () {
                                            deleteEvents(index);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              icon: const Icon(Icons.more_vert_rounded),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: eventList.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  //for search  function
  //final TextEditingController _searchController = TextEditingController();

  const SearchField({super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 360,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: 'Search',
               // prefixIcon: Icon(Icons.search_rounded),
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}



