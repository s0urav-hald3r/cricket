import 'package:flutter/material.dart';

class AppConstants {
  // Custom colors
  static Color redColor = Colors.red.shade600;

  //API endpoints
  static const accessToken = '2s1531517643142598667s1639499848610877815';
  static const fetchMatchDetailsAPI =
      'https://rest.cricketapi.com/rest/v2/schedule/?access_token=$accessToken';
}
