import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://wtzgjzinkqbxnierobum.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind0emdqemlua3FieG5pZXJvYnVtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc2NzI4NDUsImV4cCI6MjA0MzI0ODg0NX0.dBzXj8ULNUenZSFAb6MsSjp9rksCVM_pB476XtQMVjU',
  );
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

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey _aboutUsKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();



  @override
  void dispose() {
    _emailController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
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
                        'Field Report',
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => _scrollToSection(_featuresKey),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Features',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Pop up a contact form using showDialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // Create a GlobalKey for the form
                              final _formKey = GlobalKey<FormState>();
                              // Create TextEditingControllers for each input field
                              final TextEditingController _nameController =
                                  TextEditingController();
                              final TextEditingController _emailController =
                                  TextEditingController();
                              final TextEditingController _messageController =
                                  TextEditingController();

                              return AlertDialog(
                                title: const Text('Contact Us'),
                                content: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    // To prevent overflow if the content is too long
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                            'Please fill out the form below and we will contact you soon.'),
                                        const SizedBox(height: 20),
                                        TextFormField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            labelText: 'Email',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your email';
                                            }
                                            // Basic email validation
                                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                                .hasMatch(value)) {
                                              return 'Please enter a valid email';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          controller: _messageController,
                                          decoration: const InputDecoration(
                                            labelText: 'Message',
                                            border: OutlineInputBorder(),
                                          ),
                                          maxLines: 3,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a message';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Close the dialog
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Handle form submission
                                        String name = _nameController.text;
                                        String email = _emailController.text;
                                        String message =
                                            _messageController.text;

                                        // For now, just print the values
                                        print('Name: $name');
                                        print('Email: $email');
                                        print('Message: $message');

                                        // Clear the input fields
                                        _nameController.clear();
                                        _emailController.clear();
                                        _messageController.clear();

                                        // Close the dialog
                                        Navigator.of(context).pop();

                                        // Show a confirmation message
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Thank you! We will contact you soon.')),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                    ),
                                    child: const Text('Submit'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
                          'Field Report is the quickest way for technicians to generate closeout reports, cutting out wasted time, and eliminating revisits.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Form(
                          key: _formKey,
                          child: Row(
                            children: [
                              // Email Input Field
                              Expanded(
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white24,
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 0,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    // Simple email validation regex
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Submit Button
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Collect the email and print to console
                                    String email = _emailController.text;
                                    print('Collected email: $email');
                                    // Clear the input field
                                    _emailController.clear();
                                    // Show a confirmation message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Thank you! We will contact you soon.')),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text(
                                  'Join waitlist',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              key: _featuresKey,
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
                            'Field Report',
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
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                            onTap: () => _scrollToSection(_featuresKey),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Features',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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

      
                  const Center(
                    child: Text(
                      '© 2024 Field Report. All rights reserved.',
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
