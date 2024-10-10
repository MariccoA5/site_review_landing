import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: LandingPage(),
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Contact Us',
                  style: TextStyle(
                    decoration: TextDecoration.underline, 
                ),
              ),
                Text('1-360-606-0098'),
                ],
              ),
          ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            Container(
              color: const Color.fromARGB(255, 56, 129, 58),
              child: TextButton(
                onPressed: () {},
                child: const Text('Contact Us',
                style: TextStyle(color: Colors.white)),
              ),
            ),
        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Simplify, Accelerate, and Automate Field Management',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const Text(
                    'Revolutionize Your Workflow',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Optimize operations, save time, and ensure accuracy with automated site workflows.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Get Started with Your Customized Workflow',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            

            // Awards Section
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
                    backgroundColor: Colors.blue, // Button color
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
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
