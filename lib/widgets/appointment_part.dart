// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AppiontmentPart extends StatelessWidget {
//   const AppiontmentPart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//      Container(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 7,
//                         itemBuilder: (context, index) {
//                           // return Column(
//                           //   children: [
//                           InkWell(
//                             child: Container(
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 8, vertical: 5),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 8, horizontal: 25),
//                               decoration: BoxDecoration(
//                                   color: index == 1 ? Colors.blue : Colors.white,
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color.fromARGB(255, 225, 205, 205),
//                                       blurRadius: 5,
//                                       spreadRadius: 2,
//                                     ),
//                                   ]),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "${index + 8}",
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       color: index == 1
//                                           ? Colors.white
//                                           : Colors.blue.withOpacity(0.6),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   height: 2,
//                                   // ),
//                                   Text(
//                                     "DEC",
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w500,
//                                       color: index == 1
//                                           ? Colors.white
//                                           : Colors.blue.withOpacity(0.6),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                           // ],);
//                         },
//                       ),
//                     );
//                     SizedBox(
//                       height: 5,
//                     );
//                     Text(
//                       "Book Time ",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white.withOpacity(0.6),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     );
//                     SizedBox(
//                       height: 8,
//                     );
//                     Container(
//                       height: 60,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 6,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin:
//                                 EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                             padding:
//                                 EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                             decoration: BoxDecoration(
//                                 color: index == 2 ? Colors.blue : Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.red,
//                                     blurRadius: 4,
//                                     spreadRadius: 2,
//                                   )
//                                 ]),
//                             child: Center(
//                               child: Text(
//                                 "${index + 8}:00 AM",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   color: index == 2
//                                       ? Colors.white
//                                       : Colors.blueAccent.withOpacity(0.6),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ) ;
//   }
// }