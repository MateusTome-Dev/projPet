import 'package:flutter/material.dart';
import 'package:projpet/view/createdog_screen.dart';
import 'package:projpet/view/dashboard_screen.dart';
import 'package:projpet/view/user_profile_screen.dart';
import 'package:projpet/widget/dog_card.dart';

class DogsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
                        );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProfileView()),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  DogCard(
                    dogName: 'Kikiski',
                    dogAge: '3 meses',
                    imageUrl: 'assets/img/doglist1.png',
                    backgroundColor: Colors.blueAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Ginger',
                    dogAge: '4 meses',
                    imageUrl: 'assets/img/doglist1.png',
                    backgroundColor: Colors.yellowAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Scooby',
                    dogAge: '2 meses',
                    imageUrl: 'assets/img/doglist1.png',
                    backgroundColor: Colors.redAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Jackie',
                    dogAge: '5 meses',
                    imageUrl: 'assets/img/doglist1.png',
                    backgroundColor: Colors.greenAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Kikiski',
                    dogAge: '3 meses',
                    imageUrl: 'assets/img/doglist1.png',
                    backgroundColor: Colors.yellowAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Ginger',
                    dogAge: '4 meses',
                    imageUrl: 'assets/img/doglist1.png',
                    backgroundColor: Colors.blueAccent.shade100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateDogScreen(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 175, 255, 151),
        child: Icon(Icons.add),
      ),
    );
  }
}
