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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App bar
            Container(
              height: 80,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/Icon-orange.png', width: 50),
                      const SizedBox(width: 10),
                      const Text(
                        'Site Review',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Mono',
                          color: Colors.deepOrange,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'About us',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Features',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Contact Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Title for the landing page
            // Stack with the background image and content
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 685,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/telecom.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Positioned Container for content
                Positioned(
                  left: MediaQuery.sizeOf(context).width * 0.29,
                  top: MediaQuery.sizeOf(context).height * 0.2,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Moto 
                        const Text(
                          'Accelerate, Simplify,\nCloseout Reports',
                          style: TextStyle(
                            fontSize: 56,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Description
                        const Text(
                          'Site Review is the quickest way for technicians to generate closeout reports, cutting out wasted time, and eliminating site revisits.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14,
                                ),
                              ),
                              child: const Text(
                                'Learn More',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14,
                                ),
                              ),
                              child: const Text(
                                'Contact Us',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Title for the company logos section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'We’re working closely with these companies',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Section for company logos
            SizedBox(
              height: 120, // Adjust height for logos
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                
                children: [
                  // GRC Logo
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset('assets/GRC Logo.png'),
                    ),
                  ),

                  // American Tower Logo
                  Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/americantower_logo.jpg'),
                  ),
                ],
              ),
            ),

            // Seamless transition to the feature cards

            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Our Key Features',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFeatureCard('Custom Workflows', Icons.settings,
                          'Create custom workflows in minutes tailored to your company’s needs.'),
                      _buildFeatureCard('Real-Time Data', Icons.sync,
                          'Receive real-time data from the field with instant updates.'),
                      _buildFeatureCard('Save Time', Icons.timer,
                          'Reduce manual input and save hours of work on reporting.'),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              color: Colors.grey[800],
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  // AppBar content in Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/Icon-orange.png', width: 50),
                          const SizedBox(width: 10),
                          const Text(
                            'Site Review',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Mono',
                              color: Colors.deepOrange,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'About us',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Features',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 18,
                              ),
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40), // Space between sections

                  // Icons for App Store, Google Play, Email, Social Media
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Store Icon
                      IconButton(
                        icon: Image.asset(''),
                        iconSize: 50,
                        onPressed: () {
                          // Handle App Store link
                        },
                      ),
                      const SizedBox(width: 20),

                      // Google Play Icon
                      IconButton(
                        icon: Image.asset('assets/Googleplay.png'),
                        iconSize: 50,
                        onPressed: () {
                          // Handle Google Play link
                        },
                      ),
                      const SizedBox(width: 20),

                      // Email Icon
                      IconButton(
                        icon: const Icon(Icons.email, color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          // Handle email link
                        },
                      ),
                      const SizedBox(width: 20),

                      
                      IconButton(
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          // Handle Facebook link
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.computer_outlined, color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          // Handle Twitter link
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.computer, color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          // Handle LinkedIn link
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Footer Copyright Info
                  const Center(
                    child: Text(
                      '© 2024 Site Review. All rights reserved.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build feature cards
  Widget _buildFeatureCard(String title, IconData icon, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.deepOrange),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
