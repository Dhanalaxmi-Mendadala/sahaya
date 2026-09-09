import 'package:flutter/material.dart';

/// Centralized color palette for the Sahaya app.
/// Based on the green "community help" brand identity.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1E7A5F); // deep green
  static const Color primaryLight = Color(0xFF2FA37D);
  static const Color primaryDark = Color(0xFF145A45);

  static const Color background = Color(0xFFF7F8F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE3E6E1);

  static const Color textPrimary = Color(0xFF1B1F1D);
  static const Color textSecondary = Color(0xFF6B7570);
  static const Color textHint = Color(0xFFA0A8A2);

  static const Color emergency = Color(0xFFE0413A);
  static const Color emergencyDark = Color(0xFFB92E28);

  // Category colors
  static const Color food = Color(0xFFE98A2E);
  static const Color medical = Color(0xFF2E8DE9);
  static const Color transport = Color(0xFF2EBF7A);
  static const Color blood = Color(0xFFE0413A);
  static const Color education = Color(0xFF7A5CE0);
  static const Color elderlyCare = Color(0xFFD9A62E);
  static const Color childCare = Color(0xFFE05CA0);
  static const Color repair = Color(0xFF5C7AE0);

  // Urgency
  static const Color urgencyLow = Color(0xFF2FA37D);
  static const Color urgencyMedium = Color(0xFFE0A62E);
  static const Color urgencyHigh = Color(0xFFE0413A);

  static const Color badgeGold = Color(0xFFE8B84B);
  static const Color badgeBlue = Color(0xFF2E8DE9);

  static Color categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return food;
      case 'medical':
        return medical;
      case 'transport':
        return transport;
      case 'blood':
        return blood;
      case 'education':
        return education;
      case 'elderly care':
        return elderlyCare;
      case 'child care':
        return childCare;
      case 'repair':
        return repair;
      default:
        return primary;
    }
  }

  static Color urgencyColor(String urgency) {
    switch (urgency.toLowerCase()) {
      case 'low':
        return urgencyLow;
      case 'medium':
        return urgencyMedium;
      case 'high':
        return urgencyHigh;
      default:
        return urgencyLow;
    }
  }
}
