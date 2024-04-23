import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'dectors_section.dart';

// import 'dectors_section.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: must_be_immutable
class SchadualerPage extends StatelessWidget {
  SchadualerPage({super.key});
  List catNames = [
    "Dental",
    "Heart",
    "Eye",
    "Brain",
    "Ear",
    "Heart",
    "Heart",
    "Heart"
  ];

  List<Icon> catIcons = [
   
    Icon(MdiIcons.toothOutline, color: Color.fromARGB(255, 74, 55, 145), size: 30),
    Icon(
      MdiIcons.heartPlus,
      color: Color.fromARGB(255, 56, 45, 136),
      size: 30,
    ),
    Icon(
      MdiIcons.eye,
      color: Color.fromARGB(255, 77, 46, 143),
      size: 30,
    ),
    Icon(
      MdiIcons.brain,
      color: Color.fromARGB(255, 49, 53, 167),
      size: 30,
    ),
    Icon(
      MdiIcons.earHearing,
      color: Color.fromARGB(255, 74, 21, 147),
      size: 30,
    ),
    Icon(
      MdiIcons.heartPlus,
      color: Color.fromARGB(255, 72, 22, 153),
      size: 30,
    ),
    Icon(
      MdiIcons.heartPlus,
      color: Color.fromARGB(255, 72, 22, 153),
      size: 30,
    ),
     Icon(Icons.heart_broken_outlined,color:  Color.fromARGB(255, 72, 22, 153),size: 30,),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 34, 81),
      appBar: AppBar(
        title: Text('Scaduale Page'),
        backgroundColor: Color.fromARGB(255, 111, 107, 222),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Pop the current page to go back
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'lib/assets/assets_images/doctor1.jpg'),
                        ),
                        Icon(
                          Icons.notification_add_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Hi , User",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Health is our \n First Priority",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 3,
                            )
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here...",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 25,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  "Categeries",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catNames.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.red,
                      height: 80,
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.amber,
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  
                                   child: catIcons[index],
                                  // Icon(
                                  //   // catIcons[index],
                                  //   //Icons.catIcons[index],
                                  //    Icons.heart_broken_rounded,
                                  //    size: 30,
                                  // ),

                                  padding: EdgeInsets.all(15),
                                ),
                                Text(
                                  catNames[index],
                                  // 'Eye',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 196, 187, 187),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                          ),
                          SizedBox(height: 10),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 14.0),
                          //   child: Text(
                          //     "Recommended Doctors",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.w500,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          //      DectorSection(),
                        ],
                      ),
                      
                    );
                

                  },
                ),
              ),
              Container(
                child:       Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              "Recommended Doctors",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
              ),
              Container(
                height: 400,
                child: DectorSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
