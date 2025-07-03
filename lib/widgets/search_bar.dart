import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _isVegMode = false; // State for the Veg Mode toggle

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors
              .transparent, // <-- This sets the background for the whole search bar area
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ), // Optional: padding for spacing
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color:
                    AppColors
                        .lightGrey, // <-- This is just for the TextField background
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.darkGrey,
                    size: 20,
                  ),
                  hintText: 'Search pastry',
                  hintStyle: TextStyle(fontSize: 14, color: AppColors.darkGrey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  isDense: true,
                  // Add this:
                  suffixIcon: Icon(
                    Icons.mic_none,
                    color: AppColors.darkGrey,
                    size: 22,
                  ),
                ),
                style: TextStyle(fontSize: 14, color: AppColors.black),
              ),
            ),
          ),
          // SizedBox(width: 12),
          // Icon(Icons.mic_none, color: AppColors.lightGrey, size: 24),
          SizedBox(width: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white, // Makes it stand out
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryGreen, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGreen.withOpacity(0.08),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  'VEG MODE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: _isVegMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isVegMode = value;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 18, 255, 101),
                  inactiveThumbColor: AppColors.mediumGrey,
                  inactiveTrackColor: AppColors.darkGrey.withOpacity(0.5),
                  activeTrackColor: AppColors.primaryGreen.withOpacity(0.5),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
