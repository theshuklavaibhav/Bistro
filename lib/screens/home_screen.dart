import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../data/dummy_data.dart';
import '../widgets/food_card.dart';
import '../widgets/search_bar.dart' as custom_widgets;
import '../widgets/offer_banner.dart';
import '../widgets/cart_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cartItemCount = 0;

  int get _cartTotalTime {
    if (_cartItemCount > 0) {
      return dummyFoodItems.isNotEmpty ? dummyFoodItems.first.timeMinutes : 0;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- Top Section with background image ---
            Stack(
              children: [
                Container(
                  height: 420, 
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryGreen, AppColors.darkGreen],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/6.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    color: Colors.green.withOpacity(0.1),
                    colorBlendMode: BlendMode.srcATop,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTopBar(),
                    custom_widgets.SearchBar(),
                    OfferBanner(),
                    buildHorizontalFoodList(),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15,),

            // --- "WHAT'S ON YOUR MIND?" ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
              child: Row(
                children: [
                  
                  Text(
                    'WHAT\'S ON YOUR MIND?',
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(width: 16, height: 2, color: AppColors.primaryGreen),
                ],
              ),
            ),

            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategories.length,
                padding: const EdgeInsets.only(left: 16.0),
                itemBuilder: (context, index) {
                  return _CategoryItem(
                    name: dummyCategories[index]['name']!,
                    imageUrl: dummyCategories[index]['imageUrl']!,
                  );
                },
              ),
            ),

            SizedBox(height: 24),

            // --- "Everything Under ₹99" Section ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
              child: Text(
                'EVERYTHING UNDER ₹99',
                style: GoogleFonts.luckiestGuy(
                  fontSize: 20,
                  color: AppColors.black,
                ),
              ),
            ),

            Container(
              height: 360,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyUnder99Items.length,
                padding: const EdgeInsets.only(left: 16.0),
                itemBuilder: (context, index) {
                  return FoodCard(
                    textColor: const Color.fromARGB(255, 0, 0, 0),
                    item: dummyUnder99Items[index]);
                },
              ),
            ),

            SizedBox(height: 32),

            // --- Offer Banner at Bottom ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: AppColors.primaryGreen),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '50% off unlocked',
                            style: GoogleFonts.luckiestGuy(
                              fontSize: 20,
                              
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'Apply code: BISTRONEW',
                            style: GoogleFonts.luckiestGuy(
                              fontSize: 12,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(2, (index) {
                        return Container(
                          width: 6,
                          height: 6,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0 ? AppColors.darkGrey : AppColors.mediumGrey,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 100), // Extra padding
          ],
        ),
      ),

      // --- Floating Cart Bar ---
      floatingActionButton: _cartItemCount > 0
          ? Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: CartBar(
                itemCount: _cartItemCount,
                totalTimeMinutes: _cartTotalTime,
              ),
            )
          : null,

      // --- Floating Menu Button ---
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _cartItemCount > 0
          ? SizedBox(height: 0) // keeps space below CartBar
          : null,
    );
  }

  Widget buildTopBar() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 8),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Earliest delivery in',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '8 minutes',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.lightGrey),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Gurugram University, Nirvana Rd',
                        style: TextStyle(fontSize: 14, color: AppColors.lightGrey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Row(
            children: [
              Icon(Icons.electric_bolt_rounded, size: 24, color: AppColors.white),
              SizedBox(width: 16),
              Icon(Icons.person, size: 24, color: AppColors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalFoodList() {
    return Container(
      color: Colors.transparent,
      height: 360,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyFoodItems.length,
        padding: const EdgeInsets.only(left: 16.0),
        itemBuilder: (context, index) {
          return FoodCard(item: dummyFoodItems[index]);
        },
      ),
    );
  }
}

// Simple CategoryItem widget implementation
class _CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _CategoryItem({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.fastfood),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
