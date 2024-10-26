import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'firebase_service.dart';

// Initialize Supabase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

// Define the Color Palette
class ColorPalette {
  static const Color orangeWheel = Color(0xFFFF7F11);
  static const Color princetonOrange = Color(0xFFFF9530);
  static const Color cosmicLatte = Color(0xFFFFF9EB);
  static const Color mustard = Color(0xFFFDBB59);
  static const Color ashGray = Color(0xFFC0C7BD);
  static const Color khaki = Color(0xFFC0B08E);
  static const Color gray = Color(0xFF817F82);
  static const Color davyGray = Color(0xFF484748);
  static const Color blackOlive = Color(0xFF31372F);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Field Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Garamond', // Correct font family
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorPalette.orangeWheel,
          secondary: ColorPalette.princetonOrange,
          surface: ColorPalette.cosmicLatte, // Example surface color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: ColorPalette.cosmicLatte,
          border: OutlineInputBorder(),
        ),
      ),
      home: const LandingPage(),
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
  final GlobalKey _featuresKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseService _firebaseService = FirebaseService();

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

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ContactUsDialog();
      },
    );
  }

  Future<void> _handleJoinWaitlist() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      try {
        await _firebaseService.addEmail(email);
        print('Collected email: $email');
        _emailController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thank you! We will contact you soon.')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to join waitlist: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implementing a Drawer-less Navigation for Mobile using PopupMenuButton
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBarSection(
          onContactPressed: _showContactDialog,
          onFeaturesPressed: () => _scrollToSection(_featuresKey),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              emailController: _emailController,
              formKey: _formKey,
              onJoinWaitlist: _handleJoinWaitlist,
            ),
            FeaturesSection(key: _featuresKey),
            FooterSection(
              onFeaturesPressed: () => _scrollToSection(_featuresKey),
              onContactPressed: _showContactDialog,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onFeaturesPressed;

  const AppBarSection({
    Key? key,
    required this.onContactPressed,
    required this.onFeaturesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine screen size
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 1024;
        bool isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop
                ? 40.0
                : isTablet
                    ? 20.0
                    : 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(),
              if (isDesktop || isTablet)
                _buildNavItems(context, onFeaturesPressed, onContactPressed),
              if (isMobile)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onSelected: (value) {
                    switch (value) {
                      case 'About Us':
                        // Implement navigation or scrolling to About Us
                        break;
                      case 'Features':
                        onFeaturesPressed();
                        break;
                      case 'Contact Us':
                        onContactPressed();
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'About Us', 'Features', 'Contact Us'}
                        .map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.asset('assets/blueFieldReport.png', width: 50),
        const SizedBox(width: 10),
        Text(
          'Field Report',
          style: TextStyle(
            fontFamily: 'Garamond',
            color: ColorPalette.orangeWheel,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItems(
      BuildContext context, VoidCallback onFeatures, VoidCallback onContact) {
    return Row(
      children: [
        _buildNavItem('About Us', () {
          // Implement navigation or scrolling to About Us
        }),
        _buildNavItem('Features', onFeatures),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: onContact,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPalette.orangeWheel,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onJoinWaitlist;
  
  final bool _isLoading = false;

  const HeroSection({
    Key? key,
    required this.emailController,
    required this.formKey,
    required this.onJoinWaitlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine screen size
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 1024;
        bool isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        bool isMobile = constraints.maxWidth < 600;

        double imageHeight = isDesktop
            ? 685
            : isTablet
                ? 500
                : 250; // Reduced from 300 to 250 for mobile

        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: imageHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/telecom.jpg'),
                  fit: BoxFit.cover, // Changed to cover for better scaling
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                color:
                    Colors.black.withOpacity(0.4), // Semi-transparent overlay
              ),
            ),
            Positioned(
              left: isDesktop
                  ? constraints.maxWidth * 0.1
                  : isTablet
                      ? constraints.maxWidth * 0.05
                      : 16.0,
              top: isDesktop
                  ? imageHeight * 0.25
                  : isTablet
                      ? imageHeight * 0.2
                      : imageHeight * 0.1, // Adjusted for mobile
              child: _buildHeroContent(context, isDesktop, isTablet, isMobile),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeroContent(
      BuildContext context, bool isDesktop, bool isTablet, bool isMobile) {
    double widthFactor = isDesktop
        ? 0.35
        : isTablet
            ? 0.7
            : 0.9;

    return SizedBox(
      width: MediaQuery.of(context).size.width * widthFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accelerate, Simplify,\nCloseout Reports',
            style: TextStyle(
              fontSize: isMobile ? 24 : 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Field Report is the quickest way for technicians to generate closeout reports, cutting out wasted time, and eliminating revisits.',
            style: TextStyle(
              fontSize: isMobile ? 0 : 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: isMobile
                ? Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch, // Full width on mobile
                    children: [
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _isLoading ? null : onJoinWaitlist,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.orangeWheel,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                'Join waitlist',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: onJoinWaitlist,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.orangeWheel,
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
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine screen size
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 1024;
        bool isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        int columns = isDesktop
            ? 3
            : isTablet
                ? 2
                : 1;

        double horizontalPadding = isDesktop
            ? 40.0
            : isTablet
                ? 20.0
                : 16.0;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: horizontalPadding,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Text(
                  'Our Key Features',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: const [
                  FeatureCard(
                    title: 'Custom Workflows',
                    icon: Icons.settings,
                    description:
                        'Create custom workflows in minutes tailored to your company’s needs.',
                  ),
                  FeatureCard(
                    title: 'Real-Time Data',
                    icon: Icons.sync,
                    description:
                        'Receive real-time data from the field with instant updates.',
                  ),
                  FeatureCard(
                    title: 'Save Time',
                    icon: Icons.timer,
                    description:
                        'Reduce manual input and save hours of work on reporting.',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorPalette.cosmicLatte,
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
          Icon(icon, size: 40, color: ColorPalette.princetonOrange),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: ColorPalette.blackOlive,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  final VoidCallback onFeaturesPressed;
  final VoidCallback onContactPressed;

  const FooterSection({
    Key? key,
    required this.onFeaturesPressed,
    required this.onContactPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine screen size
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 1024;
        bool isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        bool isMobile = constraints.maxWidth < 600;

        double horizontalPadding = isDesktop
            ? 40.0
            : isTablet
                ? 20.0
                : 16.0;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLogo(),
                  if (isDesktop || isTablet)
                    _buildNavItems(context)
                  else if (isMobile)
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onSelected: (value) {
                        switch (value) {
                          case 'About Us':
                            // Implement navigation or scrolling to About Us
                            break;
                          case 'Features':
                            onFeaturesPressed();
                            break;
                          case 'Contact Us':
                            onContactPressed();
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return {'About Us', 'Features', 'Contact Us'}
                            .map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                ],
              ),
              const SizedBox(height: 40),
              // Footer Bottom Text
              const Center(
                child: Text(
                  '© 2024 Field Report. All rights reserved.',
                  style: TextStyle(
                    color: ColorPalette.davyGray,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.asset('assets/blueFieldReport.png', width: 50),
        const SizedBox(width: 10),
        Text(
          'Field Report',
          style: TextStyle(
            fontFamily: 'Garamond',
            color: ColorPalette.orangeWheel,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItems(BuildContext context) {
    return Row(
      children: [
        _buildNavItem('About Us', () {
          // Implement navigation or scrolling to About Us
        }),
        _buildNavItem('Features', onFeaturesPressed),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: onContactPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPalette.orangeWheel,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: ColorPalette.davyGray,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

Widget _buildLogo() {
  return Row(
    children: [
      Image.asset('assets/blueFieldReport.png', width: 50),
      const SizedBox(width: 10),
      Text(
        'Field Report',
        style: TextStyle(
          fontFamily: 'Garmond',
          color: ColorPalette.orangeWheel,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget _buildFooterNav(BuildContext context) {
  return Row(
    children: [
      _buildFooterNavItem('About Us', () {
        // Implement navigation or scrolling to About Us
      }),
      _buildFooterNavItem('Features', () {
        // Implement scrolling to Features
      }),
    ],
  );
}

Widget _buildFooterNavItem(String title, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: ColorPalette.davyGray,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

class ContactUsDialog extends StatefulWidget {
  const ContactUsDialog({Key? key}) : super(key: key);

  @override
  _ContactUsDialogState createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // Instantiate FirebaseService
  final FirebaseService _firebaseService = FirebaseService();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      try {
        await _firebaseService.addEmail(email);
        print('Collected email: $email');
        _emailController.clear();
        // Close the dialog
        Navigator.of(context).pop();
        // Show a confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Thank you! We will contact you soon.')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Contact Us'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                  'Please enter your email and we will contact you soon.'),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Basic email validation
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
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
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPalette.blackOlive,
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
