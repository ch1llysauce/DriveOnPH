import 'package:flutter/material.dart';

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
                    // First row: 2 boxes
                    Row(
                      children: [
                        Expanded(
                          child: _buildGridBox("Road Signs and Regulations"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: _buildGridBox("Driving Techniques")),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Second row: 2 boxes
                    Row(
                      children: [
                        Expanded(child: _buildGridBox("Progress Tracker")),
                        const SizedBox(width: 16),
                        Expanded(child: _buildGridBox("License Application")),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Third row: 1 box
                    _buildFullWidthGridBox(
                      "Find Nearest Driving Schools and LTO Branches",
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom navigation bar (home, profile, about)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: _NavItem(
                      icon: Icons.car_repair,
                      label: "Home",
                      selected: true,
                    ),
                  ),
                  Expanded(
                    child: _NavItem(
                      icon: Icons.person,
                      label: "Profile",
                      selected: false,
                    ),
                  ),
                  Expanded(
                    child: _NavItem(
                      icon: Icons.info,
                      label: "About",
                      selected: false,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Header section (top)
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.menu, size: 32, color: Colors.black),
                    CircleAvatar(radius: 22, backgroundColor: Colors.grey),
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
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable white grid box with vertical layout (image above label)
  Widget _buildGridBox(String label) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            color: Colors.grey[300],
            child: const Icon(Icons.image, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullWidthGridBox(String label) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            color: Colors.grey[300],
            child: const Icon(Icons.image, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom nav item widget
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
          color: selected ? Color(0xFF6595C4) : Colors.black54,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? Color(0xFF6595C4) : Colors.black54,
          ),
        ),
      ],
    );
  }
}
