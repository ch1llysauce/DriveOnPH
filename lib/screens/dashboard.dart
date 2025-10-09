import 'package:flutter/material.dart';
import 'roadSignsFeature/roadSigns.dart';

// Dashboard Screen
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Color(0xFF6595C4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: [
                    // First row
                    Row(
                      children: [
                        Expanded(
                          child: _buildGridButton(
                            context,
                            "Road Signs and Regulations",
                            'lib/assets/road_signs_dashboard.png',
                            const RoadSignsScreen(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildGridButton(
                            context,
                            "Driving Techniques",
                            'lib/assets/driving_techniques_dashboard.png',
                            const DrivingTechniquesScreen(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Second row
                    Row(
                      children: [
                        Expanded(
                          child: _buildGridButton(
                            context,
                            "Progress Tracker",
                            'lib/assets/progress_tracker_dashboard.png',
                            const ProgressTrackerScreen(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildGridButton(
                            context,
                            "License Application",
                            'lib/assets/license_app_dashboard.png',
                            const LicenseAppScreen(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Third row (full width)
                    _buildFullWidthGridButton(
                      context,
                      "Find Nearest Driving Schools and LTO Branches",
                      'lib/assets/map_dashboard.png',
                      const MapScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _NavItem(
                      icon: Icons.car_repair,
                      label: "Home",
                      selected: true,
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: const _NavItem(
                        icon: Icons.person,
                        label: "Profile",
                        selected: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AboutScreen(),
                          ),
                        );
                      },
                      child: const _NavItem(
                        icon: Icons.info,
                        label: "About",
                        selected: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Header (no hamburger menu)
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile button on the right
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Good to see you, [User]! Let’s keep learning and driving safe.",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Grid box
  Widget _buildGridButton(
    BuildContext context,
    String label,
    String imagePath,
    Widget screen,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Full width button
  Widget _buildFullWidthGridButton(
    BuildContext context,
    String label,
    String imagePath,
    Widget screen,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Bottom nav item
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: selected ? const Color(0xFF6595C4) : Colors.black54,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? const Color(0xFF6595C4) : Colors.black54,
          ),
        ),
      ],
    );
  }
}

// Placeholder screens
class DrivingTechniquesScreen extends StatelessWidget {
  const DrivingTechniquesScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      _SimpleScreen(title: 'Driving Techniques');
}

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      _SimpleScreen(title: 'Progress Tracker');
}

class LicenseAppScreen extends StatelessWidget {
  const LicenseAppScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      _SimpleScreen(title: 'License Application');
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      _SimpleScreen(title: 'Find Nearest Driving Schools and LTO Branches');
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => _SimpleScreen(title: 'Profile');
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) => _SimpleScreen(title: 'About');
}

// Simple placeholder layout
class _SimpleScreen extends StatelessWidget {
  final String title;
  const _SimpleScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF6595C4),
      ),
      body: Center(
        child: Text(
          "Welcome to $title!",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
