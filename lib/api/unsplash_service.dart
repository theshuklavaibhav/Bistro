import 'dart:convert';
import 'package:http/http.dart' as http;

// !! IMPORTANT: Replace with your actual Unsplash Access Key !!
// You can get one by registering as a developer on unsplash.com/developers
const String UNSPLASH_ACCESS_KEY = 'eG1ns0gO8Qlvzbxu8L3xcPKq-MWzWoWOaaJq6p0jGt0'; // <--- REPLACE THIS

class UnsplashService {
  final String _baseUrl = 'https://api.unsplash.com';

  // Search Unsplash for photos based on a query
  Future<String?> searchFoodImage(String query) async {
    // Basic input validation
    if (UNSPLASH_ACCESS_KEY == 'UNSPLASH_ACCESS_KEY' || UNSPLASH_ACCESS_KEY.isEmpty) {
       print("Error: Unsplash Access Key is not set!");
       return null; // Or throw an error
    }

    // Construct the API endpoint URL
    // We search for photos, limit to 1 result, and set orientation to landscape
    // You can adjust query parameters as needed (e.g., per_page, orientation)
    final uri = Uri.parse(
        '$_baseUrl/search/photos?query=$query food&per_page=1&orientation=landscape'); // Added " food" to query for better results

    try {
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Client-ID $UNSPLASH_ACCESS_KEY',
        },
      );

      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = json.decode(response.body);

        // Parse the results
        final results = data['results'] as List;

        // If we got any results, return the URL of the first image
        if (results.isNotEmpty) {
          // We want the 'regular' sized image URL
          return results[0]['urls']['regular'] as String;
        } else {
          // No results found for the query
          print('No Unsplash image found for: $query');
          return null;
        }
      } else {
        // Handle API errors (e.g., rate limiting, invalid key)
        print('Failed to load Unsplash image for "$query". Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null; // Return null on error
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Exception while fetching Unsplash image for "$query": $e');
      return null; // Return null on exception
    }
  }
}