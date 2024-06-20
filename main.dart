import 'package:flutter/material.dart';

void main() {
  runApp(CreateTeamApp());
}

class CreateTeamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateTeamScreen(),
    );
  }
}

class CreateTeamScreen extends StatefulWidget {
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  List<bool> isAdded = List<bool>.generate(10, (index) => index == 0);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Color(0xFF7775F8),
      appBar: AppBar(
        backgroundColor: Color(0xFF7775F8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Create Team'),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/wallet.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search & add',
                prefixIcon: Image.asset('assets/images/search.png'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.02),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Team 01 / 11',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: Container(
              width: screenWidth * 0.9,
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'STOCK NAME', // Replace with actual data
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '443', // Replace with actual data
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '+1.80 (4.32%)', // Replace with actual data
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Image.asset(
                              isAdded[index]
                                  ? 'assets/images/subtraction.png'
                                  : 'assets/images/addition.png',
                            ),
                            onPressed: () {
                              setState(() {
                                isAdded[index] = !isAdded[index];
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(color: Color(0xFFC4C4C4)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
