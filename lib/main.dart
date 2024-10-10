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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Fire Capital',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Access Awarded The Finance Credit For Your Business',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Apply Today & Get Pre-Approval In Just 24 Hours.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Apply Today & Get Pre-Approval In 24 Hours'),
                  ),
                ],
              ),
            ),

            // Feature Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
             
                children: [
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 10),
                      Text('Access cash upfront for unpaid invoices.'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 10),
                      Text('Extend payment terms.'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 10),
                      Text('Competitive rates and adaptable solutions.'),
                    ],
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
                      Icon(Icons.star, size: 50, color: Colors.amber),
                      Text('Best Trade Finance'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.star, size: 50, color: Colors.amber),
                      Text('Best Business Loans'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.star, size: 50, color: Colors.amber),
                      Text('Best Customer Service'),
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
                  _buildBenefitCard('30-minute eligibility check', Icons.access_time),
                  _buildBenefitCard('Get an offer in 24 hours', Icons.schedule),
                  _buildBenefitCard('Access cash on demand', Icons.attach_money),
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
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Apply Today & Get Pre-Approval In 24 Hours'),
                ),
              ),
            ),

            // Statistics Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'We’ve funded over \$2B to 3,000+ SMEs.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Fire Capital’s funding solution is built for Aussie SMEs looking to stop cash flow challenges.',
                    style: TextStyle(color: Colors.grey[700]),
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
      width: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


