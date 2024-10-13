import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 0, 16),
                  child: Image.asset('assets/Icon-orange.png', width: 50),
                ),
                const Text(
                  'Site Review',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Mono',
                    color: Colors.deepOrange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'About us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'IBM Plex Mono',
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'IBM Plex Mono',
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IBM Plex Mono',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IBM Plex Mono',
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Background Image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 750,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/telecom.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),

            // Benefit Icons Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.star, size: 50, color: Colors.orange),
                      Text('Best Workflow Automation'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.star, size: 50, color: Colors.orange),
                      Text('Top Industry Tool'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.star, size: 50, color: Colors.orange),
                      Text('Highly Rated by Managers'),
                    ],
                  ),
                ],
              ),
            ),

            // Main Benefits Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBenefitCard('Save hours of manual work', Icons.timer),
                  _buildBenefitCard('Custom workflows in minutes', Icons.build),
                  _buildBenefitCard('Collect real-time input', Icons.sync),
                ],
              ),
            ),

            // Call-to-Action Section
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Start Automating Your Workflow Today',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            // Statistics Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'We’ve transformed field management for 500+ companies.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Our solution ensures managers spend less time on paperwork and more on driving productivity.',
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitCard(String title, IconData icon) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
