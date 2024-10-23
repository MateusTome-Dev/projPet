import 'package:flutter/material.dart';
import 'package:projpet/view/doglist_screen.dart';

void main() {
  runApp(CreateDogScreen());
}

class CreateDogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreatePetInformation(),
    );
  }
}

class CreatePetInformation extends StatefulWidget {
  @override
  _CreatePetInformationState createState() => _CreatePetInformationState();
}

class _CreatePetInformationState extends State<CreatePetInformation> {
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  bool isMale = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DogsListScreen()),
                        );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Adicionar Cachorro',
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildTextField("Espécie:", speciesController),
            SizedBox(height: 15),
            buildTextField("Raça:", breedController),
            SizedBox(height: 15),
            buildTextField("Nome:", nameController),
            SizedBox(height: 15),
            buildDateField(context, "Idade:", dateController),
            SizedBox(height: 15),
            Text(
              "Genero:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            ToggleButtons(
              borderRadius: BorderRadius.circular(20),
              isSelected: [isMale, !isMale],
              onPressed: (int index) {
                setState(() {
                  isMale = index == 0;
                });
              },
              children: [
                Container(
                  width: size.width * 0.4,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: Text("Masculino")),
                ),
                Container(
                  width: size.width * 0.4,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: Text("Feminino")),
                ),
              ],
              color: Colors.black,
              selectedColor: Colors.white,
              fillColor: Color(0xFF7E57C2),
            ),
            SizedBox(height: 25),
            
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context, String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              });
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ],
    );
  }
}
