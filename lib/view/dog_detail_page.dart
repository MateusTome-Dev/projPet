import 'package:flutter/material.dart';

class DogDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Color(0xFF7E57C2), // Cor de fundo roxa
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
      body: Column(
        children: [
          // Imagem do cachorro
          Container(
            height: size.height * 0.4,
            child: Image.asset('assets/img/doglist1.png', // Substitua pela URL da imagem do cachorro
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
                  // Nome e preço
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kikiski',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '\$200',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  // Descrição
                  Text(
                    'Meet our American Eskimo dog. Kikiski is a fluffy bundle of joy looking for a forever home. Adopt Kikiski today and let the happiness begin.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Spacer(),
                  // Botão "Adopt me"
                  Center(
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          // Ação ao clicar no botão
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7E57C2), // Substitui "primary" por "backgroundColor"
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
