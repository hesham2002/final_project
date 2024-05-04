import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/dropdown.dart';
// ignore: must_be_immutable
class TransformScreen extends StatefulWidget {
  TransformScreen({super.key,this.selectedValue});
  String? selectedValue;

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  final List<String> items = ['Hospital 1', 'Hospital 2', 'Hospital 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color.fromARGB(255, 30, 30, 84),
      body: Container(
        child: Padding(
          padding:  EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              
  Center(
    child:
GestureDetector(
      onTap: () {
    
  },
    child: Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text('Transform'),
      ),
      ),
  ),
    
  ),
  SizedBox(height: 50,) ,  

TextFormField(
  decoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    hintText: 'Name',
  ),
),
SizedBox(height: 10,),
TextFormField(
  decoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    hintText: 'Age',
  ),
),
SizedBox(height: 10,),
TextFormField(

  decoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    hintText: 'Report',
    suffixIcon: Icon(Icons.add_a_photo_outlined,color: Colors.blue,), 
    
  ),
  
),
          
//  Container(
  // width: 200,
  // height: 40,
  // decoration: BoxDecoration(
    // color: Colors.white,
    // border: Border.all(
      // color: Colors.blue,
      // width: 2,
    // ),
    // borderRadius: BorderRadius.circular(50),
  // ),
  // child: Padding(
    // padding: const EdgeInsets.all(8.0),
    // child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: [
        // Text('elect'),
        // DropdownButtonHideUnderline(
          // child: DropdownButton(
            // value: 'Select',
            // items: [
              // 'John',
              // 'Jane',
              // 'Bob',
              // 'Alice',
            // ].map((e) {
              // return DropdownMenuItem(
                // child: Text(e),
                // value: e,
              // );
            // }).toList(),
            // onChanged: (value) {},
          // ),
        // ),
      // ],
    // ),
  // ),
// ) 
          // 
             SizedBox(height: 60,),
             Padding(
               padding: const EdgeInsets.only(right:80.0),
               child: Container(
                
                color: Colors.white,
                 child: Row( 
                   children: [  
                     DropdownButton<String>(
                       value: widget.selectedValue,
                       onChanged: (newValue) {
                         setState(() {
                                     var selectedValue = newValue;
                         });
                       },
                       items: items.map((String value) {
                         return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value),
                         );
                       }).toList(),
                     ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Select",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                     ),),
                   ),
                   ],
                 ),
               ),
             ),
        SizedBox(height: 30,),
          GestureDetector(
      onTap: () {
    
  },
    child: Padding(
      padding: const EdgeInsets.only(left:80.0),
      child: Container(
        width: 230,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(255, 3, 17, 29),
            width: 1,
          ),
          // borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text('Send',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
        ),
        ),
    ),
  ),
    
            ], 
            
          ),
        ),
      ),
    );
  }
}