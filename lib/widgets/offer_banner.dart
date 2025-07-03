import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Colors.transparent, // Changed background color to primary green
      child: Column(
        children: [
          Text(
            'ON THIS ORDER',
            style: GoogleFonts.luckiestGuy(
              fontSize: 15,
              color: AppColors.white,
              
              letterSpacing: 0.5,
              
            ),
            
          ),
          SizedBox(height: 4),
          Text(
            'GET 50% OFF ON EVERYTHING!',
            textAlign: TextAlign.center,
            style: GoogleFonts.luckiestGuy(
              fontSize: 26,
              color: AppColors.white,
              
            ),
          ),
          SizedBox(height: 4),
          Text(
            '(MAX DISCOUNT UP TO ₹100)',
            style: GoogleFonts.luckiestGuy(
              fontSize: 15,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}