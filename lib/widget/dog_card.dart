import 'package:flutter/material.dart';
import 'package:projpet/view/dog_detail_page.dart';

class DogCard extends StatelessWidget {
  final String dogName;
  final String dogAge;
  final String imageUrl;
  final Color backgroundColor;

  const DogCard({
    required this.dogName,
    required this.dogAge,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogDetailPage(
              dogName: dogName,
              dogAge: dogAge,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 80,
            ),
            SizedBox(height: 8),
            Text(
              dogName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              dogAge,
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 15, 15, 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
