import 'package:flutter/material.dart';

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
  final TextEditingController speciesController = TextEditingController(text: "Dog");
  final TextEditingController breedController = TextEditingController(text: "American Eskimo");
  final TextEditingController nameController = TextEditingController(text: "Snowy");
  final TextEditingController dateController = TextEditingController();
  bool isMale = true;
  bool isLookingForHome = true;

  @override
  void initState() {
    super.initState();
    dateController.text = "27/09/23"; // Data padrão
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
            // Voltar à página anterior
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Create Pet',
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildTextField("Species", speciesController),
            SizedBox(height: 15),
            buildTextField("Breed", breedController),
            SizedBox(height: 15),
            buildTextField("Pet’s new name", nameController),
            SizedBox(height: 15),
            buildDateField(context, "Birthday or Adoption day", dateController),
            SizedBox(height: 15),
            Text(
              "Gender",
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
                  child: Center(child: Text("Male")),
                ),
                Container(
                  width: size.width * 0.4,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: Text("Female")),
                ),
              ],
              color: Colors.black,
              selectedColor: Colors.white,
              fillColor: Color(0xFF7E57C2),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Looking for a home",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Switch(
                  value: isLookingForHome,
                  activeColor: Color(0xFF7E57C2),
                  onChanged: (value) {
                    setState(() {
                      isLookingForHome = value;
                    });
                  },
                ),
              ],
            ),
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
