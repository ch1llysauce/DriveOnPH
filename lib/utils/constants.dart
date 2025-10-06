class GameConstants {
  // Screen dimensions
  static const double gameWidth = 800.0;
  static const double gameHeight = 1600.0;
  
  // Car properties
  static const double carWidth = 60.0;
  static const double carHeight = 120.0;
  static const double maxSpeed = 200.0;
  static const double acceleration = 100.0;
  static const double brakeForce = 150.0;
  
  // Scoring
  static const int lanePoints = 10;
  static const int speedPoints = 5;
  static const int rulePoints = 20;
  static const int parkingBonus = 100;
  
  // Penalties
  static const int offRoadPenalty = -20;
  static const int speedingPenalty = -10;
  static const int redLightPenalty = -50;
  static const int collisionPenalty = -100;
  
  // Colors
  static const int greenColor = 0xFF4CAF50;
  static const int yellowColor = 0xFFFFC107;
  static const int redColor = 0xFFF44336;
}