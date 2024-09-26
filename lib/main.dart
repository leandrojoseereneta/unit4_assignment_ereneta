import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LEANDRO JOSE EREÑETA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileSection(),
              const SizedBox(height: 24),
              buildInfoSection(),
              const SizedBox(height: 24),
              buildBiographySection(),
              const SizedBox(height: 24),
              buildTableSection(),
              const SizedBox(height: 24),
              buildGridViewSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileSection() => sectionWrapper(
        Row(
          children: [
            const CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/profile.jpg')),
            const SizedBox(width: 16),
            const Text('Leandro Jose Ereñeta', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
            const Spacer(),
          ],
        ),
      );

  Widget buildInfoSection() => sectionWrapper(
        Column(
          children: [
            buildInfoRow(Icons.cake, 'Birthday', 'January 29, 2003', Colors.brown),
            buildInfoRow(Icons.house, 'Address', 'Barotac Nuevo, Iloilo, Philippines', Colors.green),
            buildInfoRow(Icons.email, 'Email', 'leandrojose.ereneta@email.com', Colors.indigo),
            buildInfoRow(Icons.phone, 'Phone', '09395650266', Colors.green),
            buildInfoRow(Icons.school, 'Education', 'West Visayas State University', Colors.orange),
            buildInfoRow(Icons.games, 'Hobbies', 'Playing Games, Sleeping, Watching Movies', Colors.purple),
          ].expand((widget) => [widget, const SizedBox(height: 16)]).toList(),
        ),
      );

  Widget buildBiographySection() => sectionWrapper(
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Me', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo)),
            SizedBox(height: 8),
            Text(
              'I am a 3rd-year student at West Visayas State University pursuing a degree in Information Technology. '
              'I enjoy learning new things in tech, working on simple projects, and balancing school with personal interests. '
              'I am passionate about coding and look forward to a career in IT.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      );

  Widget buildTableSection() => Table(
        border: TableBorder.all(),
        children: const [
          TableRow(children: [TextCell('Course'), TextCell('Grade')]),
          TableRow(children: [TextCell('CC 206'), TextCell('1.0')]),
        ],
      );

  Widget buildGridViewSection() => Container(
        height: 500,
        width: 500,
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(1, (index) => buildGridItem()),
        ),
      );

  Widget buildGridItem() => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 114, 170, 241),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [buildBoxShadow()],
        ),
        child: const Center(
          child: Icon(Icons.gamepad, size: 200, color: Color.fromARGB(255, 0, 255, 213)),
        ),
      );

  Widget buildInfoRow(IconData icon, String title, String data, Color iconColor) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: iconColor),
          const SizedBox(width: 15),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18, color: Colors.black87))),
          const SizedBox(width: 8),
          Expanded(flex: 7, child: Text(data, style: const TextStyle(fontSize: 16, color: Colors.black54))),
        ],
      );

  BoxDecoration boxDecoration() => BoxDecoration(
        color: const Color.fromARGB(255, 201, 214, 235),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [buildBoxShadow()],
      );

  BoxShadow buildBoxShadow() => BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      );

  Widget sectionWrapper(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: boxDecoration(),
        child: child,
      );
}

class TextCell extends StatelessWidget {
  final String text;
  const TextCell(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      );
}
