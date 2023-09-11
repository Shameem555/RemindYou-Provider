
// import 'package:flutter/material.dart';
// import 'package:reminder/functions/events_db.dart';
// import 'package:reminder/screen/listScreen.dart';

// class SearchField extends StatefulWidget {
//   const SearchField({super.key});

//   @override
//   State<SearchField> createState() => _SearchFieldState();
// }

// class _SearchFieldState extends State<SearchField> {
//   TextEditingController searchQueryController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Card(
//         elevation: 9,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: TextField(
//             controller: searchQueryController,
//             onChanged: (query) {
//               searchResult(query);
//             },
//             decoration: InputDecoration(
//                 hintText: 'Search..',
//                 border: InputBorder.none,
//                 icon: const Icon(
//                   Icons.search,
//                   // color: textClr,
//                 ),
//                 suffixIcon: IconButton(
//                     onPressed: () {
//                       overViewListNotifier.value =
//                           EventsDB.instance.eventListNotifier.value;
//                       searchQueryController.clear();
//                     },
//                     icon: const Icon(
//                       Icons.close,
//                       // color: Colors.black,
//                     ),),),
//           ),
//         ),
//       ),
//     );
//   }

//   searchResult(String query) {
//     if (query.isEmpty || query == '') {
//       debugPrint(query);

//       overViewListNotifier.value =
//           EventsDB.instance.eventListNotifier.value;
//     } else {
//       overViewListNotifier.value = overViewListNotifier.value
//           .where((element) =>
//               element.title
//                   .toLowerCase()
//                   .contains(query.trim().toLowerCase()) ||
//               element.catogory.contains(query.trim().toLowerCase()))
//           .toList();
//     }
//   }
// }