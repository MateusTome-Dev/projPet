import 'package:flutter/material.dart';
import 'package:projpet/widget/dog_card.dart';

class DogsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Cor de fundo suave
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'), // URL de exemplo do avatar
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de Pesquisa
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
            // Texto "Categories"
            
            SizedBox(height: size.height * 0.03),
            // Lista de Cachorros
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  DogCard(
                    dogName: 'Kikiski',
                    dogAge: '3 months',
                    imageUrl:'assets/img/doglist1.png',
                    backgroundColor: Colors.blueAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Ginger',
                    dogAge: '4 months',
                    imageUrl:'assets/img/doglist1.png',
                    backgroundColor: Colors.yellowAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Scooby',
                    dogAge: '2 months',
                    imageUrl:'assets/img/doglist1.png', // Substituir pela URL da imagem do cachorro
                    backgroundColor: Colors.redAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Jackie',
                    dogAge: '5 months',
                    imageUrl:'assets/img/doglist1.png', // Substituir pela URL da imagem do cachorro
                    backgroundColor: Colors.greenAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Kikiski',
                    dogAge: '3 months',
                    imageUrl:'assets/img/doglist1.png',
                    backgroundColor: Colors.yellowAccent.shade100,
                  ),
                  DogCard(
                    dogName: 'Ginger',
                    dogAge: '4 months',
                    imageUrl:'assets/img/doglist1.png',
                    backgroundColor: Colors.blueAccent.shade100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
