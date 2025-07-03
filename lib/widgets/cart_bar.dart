import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CartBar extends StatelessWidget {
  final int itemCount;
  final int totalTimeMinutes;

  const CartBar({
    Key? key,
    required this.itemCount,
    required this.totalTimeMinutes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.transparent, // Cart bar uses dark green
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Item count and time
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$itemCount ${itemCount == 1 ? 'item' : 'items'}',
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Icon(Icons.circle, color: AppColors.primaryGreen, size: 10), // Changed color to primary green
              SizedBox(width: 4),
              Text(
                '$totalTimeMinutes mins',
                style: TextStyle(fontSize: 13, color: AppColors.white),
              ),
            ],
          ),
          // View Cart button/text
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View cart',
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}