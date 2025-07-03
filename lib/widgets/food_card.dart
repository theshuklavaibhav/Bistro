import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../models/food_item.dart';
import '../constants/colors.dart';
import '../api/unsplash_service.dart';

class FoodCard extends StatefulWidget {
  final FoodItem item;
  final Color textColor; // <-- Add this

  const FoodCard({
    Key? key,
    required this.item,
    this.textColor = Colors.white, // Default to white
  }) : super(key: key);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int _quantity = 0;
  Future<String?>? _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = UnsplashService().searchFoodImage(widget.item.name);
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      // Implement cart state update logic here
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
        // Implement cart state update logic here
      }
    });
  }

  Widget _buildStarRating(double rating, int reviews) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder:
              (context, index) =>
                  Icon(Icons.star, color: AppColors.yellowRating),
          itemCount: 5,
          itemSize: 14.0,
          direction: Axis.horizontal,
        ),
        SizedBox(width: 4),
        Text(
          '(${reviews})',
          style: TextStyle(fontSize: 11, color: widget.textColor),
        ),
      ],
    );
  }

  Widget _buildDescription(List<String> description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          description.map((point) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 5, color: widget.textColor),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(fontSize: 11, color: widget.textColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildShimmerImagePlaceholder() {
    return Shimmer.fromColors(
      baseColor: AppColors.lightGrey,
      highlightColor: AppColors.mediumGrey,
      child: Container(
        height: 120,
        color: const Color.fromARGB(145, 134, 133, 133),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkGreen.withOpacity(0.85), // Dark green at the top
            Colors.transparent, // Transparent at the bottom
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: FutureBuilder<String?>(
              future: _imageFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildShimmerImagePlaceholder();
                } else if (snapshot.hasError || snapshot.data == null) {
                  print(
                    'Error loading image or no image found: ${snapshot.error}',
                  );
                  return Container(
                    height: 120,
                    color: AppColors.lightGrey,
                    child: Center(
                      child: Icon(
                        Icons.fastfood,
                        size: 40,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  );
                } else {
                  return Image.network(
                    snapshot.data!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return _buildShimmerImagePlaceholder();
                    },
                    errorBuilder: (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return Container(
                        height: 120,
                        color: AppColors.lightGrey,
                        child: Center(
                          child: Icon(
                            Icons.error_outline,
                            size: 40,
                            color: AppColors.red,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time
                Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      color: widget.textColor,
                      size: 20,
                    ), // Changed color to primary green
                    SizedBox(width: 4),
                    Text(
                      '${widget.item.timeMinutes} mins',
                      style: TextStyle(fontSize: 14, color: widget.textColor),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // Title
                Text(
                  widget.item.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // Rating
                _buildStarRating(widget.item.rating, widget.item.reviews),
                SizedBox(height: 8),
                // Description
                _buildDescription(widget.item.description),
                SizedBox(height: 8),
                // Price and Add Button/Counter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price
                    Text(
                      '₹${widget.item.price.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: widget.textColor,
                      ),
                    ),
                    // Add Button or Counter
                    _quantity == 0
                        ? ElevatedButton(
                          onPressed: _incrementQuantity,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 6,
                            ),
                            minimumSize: Size(70, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 0,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        : Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: AppColors.white,
                                  size: 16,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(
                                  minWidth: 28,
                                  minHeight: 28,
                                ),
                                onPressed: _decrementQuantity,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  '$_quantity',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                  size: 16,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(
                                  minWidth: 28,
                                  minHeight: 28,
                                ),
                                onPressed: _incrementQuantity,
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
