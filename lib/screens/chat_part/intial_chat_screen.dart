import 'package:flutter/material.dart';

class IntialChatScreen extends StatefulWidget {
  @override
  State<IntialChatScreen> createState() => _IntialChatScreenState();
}

class _IntialChatScreenState extends State<IntialChatScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.linear_scale_outlined, color: Colors.grey),
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    hintText: "Search",
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(
                  Icons.history_toggle_off_outlined,
                  color: Colors.grey.withOpacity(.5),
                ),
                SizedBox(width: 10),
                Text(
                  "Stories",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          // Placeholder for the user's profile picture
                          backgroundColor: Colors.grey,
                        ),
                        Positioned(
                          right: 1,
                          bottom: 1,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.red,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(
                  Icons.message_outlined,
                  color: Colors.grey.withOpacity(.5),
                ),
                SizedBox(width: 10),
                Text(
                  "All Messages",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your actual item count
                itemBuilder: (context, index) {
                  // Replace this with your chat item UI
                  return ListTile(
                    title: Text("Chat $index"),
                    subtitle: Text("Subtitle $index"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
