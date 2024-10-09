import 'package:flutter/material.dart';

void main() {
  runApp(DashboardScreen());
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pegando o tamanho da tela para fazer ajustes responsivos
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Color(0xFF7E57C2), // Cor de fundo roxa
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Espaçamento mais compacto
          children: [
            SizedBox(height: size.height * 0.1), // Espaço superior
            Column(
              children: [
                Text(
                  'HOME FOR PAWS',
                  style: TextStyle(
                    fontSize: size.width * 0.08, // Tamanho ajustado do título
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Text(
                  'Adopt, Don\'t Shop',
                  style: TextStyle(
                    fontSize: size.width * 0.05, // Tamanho ajustado do subtítulo
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
            Image.network(
              'https://www.pedigree.com.br/cdn-cgi/image/format=auto,q=90/sites/g/files/fnmzdf2401/files/2022-04/hero-icon-Savannah_0.png', // Substituir pela URL da imagem do cachorro
              height: size.height * 0.3, // Ajuste proporcional da imagem
            ),
            Column(
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    width: size.width * 0.5,
                    height: size.height * 0.06, // Altura menor para os botões
                    child: ElevatedButton(
                      onPressed: () {
                        // Ação do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: size.width * 0.045, // Tamanho ajustado do texto
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Diminuir o espaçamento entre os botões
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    width: size.width * 0.5,
                    height: size.height * 0.06, // Altura menor para os botões
                    child: ElevatedButton(
                      onPressed: () {
                        // Ação do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Sign-up',
                        style: TextStyle(
                          fontSize: size.width * 0.045, // Tamanho ajustado do texto
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02), // Menor espaço inferior
          ],
        ),
      ),
    );
  }
}
