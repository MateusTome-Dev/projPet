import 'package:flutter/material.dart';

class DogDetailPage extends StatelessWidget {
  final String dogName;
  final String dogAge;
  final String imageUrl;

  const DogDetailPage({
    required this.dogName,
    required this.dogAge,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF7E57C2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [

          Container(
            height: size.height * 0.4,
            child: Image.asset(
              imageUrl, 
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dogName,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  
                  Text(
                    'Conheça $dogName, um companheiro leal à espera de um lar cheio de amor. Com $dogAge de pura energia e carinho, $dogName adora brincar, explorar e ficar ao seu lado nos momentos de descanso. Ele já está vacinado, saudável e pronto para se tornar parte da sua família.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Spacer(),

                  Center(
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7E57C2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Adopt me',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
