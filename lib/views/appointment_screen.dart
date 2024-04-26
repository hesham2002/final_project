import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("lib/assets/assets_images/doctor1.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(136, 143, 139, 139).withOpacity(0.9),
                        Color.fromARGB(136, 94, 85, 85).withOpacity(0),
                        const Color.fromARGB(137, 181, 70, 70).withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 0.0, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 64, 64, 125),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(134, 100, 48, 48)
                                                  .withOpacity(0.9),
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                        )
                                      ]),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.red,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  width: 40,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2f2f8f),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(135, 187, 174, 174)
                                                .withOpacity(0.9),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: const Color.fromARGB(
                                          255, 216, 158, 158),
                                      size: 28,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Patients",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "1.8k",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Experience",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "10 yr",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rating",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr looney",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.heartPlus,
                          size: 30,
                          color: const Color.fromARGB(255, 125, 66, 62),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Surgeon",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Lorem Ipsum, dizgi ve bask. Lorem Ipsum, ad bilinmeyen bir matbaan oluşturmak üzere bir yaz ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Book Date",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black26.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 60,
                            child: Column(
                              children: [
                                // InkWell(
                                //   child:
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 25),
                                  decoration: BoxDecoration(
                                      color: index == 1
                                          ? Color.fromARGB(255, 64, 91, 119)
                                          : Color.fromARGB(255, 35, 18, 18),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFE1CDCD),
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${index + 8}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: index == 1
                                              ? Color.fromARGB(255, 146, 75, 75)
                                              : Colors.blue.withOpacity(0.8),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "DEC",
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          color: index == 1
                                              ? Color.fromARGB(255, 185, 90, 90)
                                              : Color.fromARGB(
                                                      255, 74, 111, 142)
                                                  .withOpacity(0.6),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //);
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Book Time ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                                color: index == 2 ? Colors.blue : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 213, 193, 191),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                "${index + 8}:00 AM",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: index == 2
                                      ? Colors.white
                                      : Colors.blueAccent.withOpacity(0.6),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          color: Colors.blue,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Book Appiontment",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
