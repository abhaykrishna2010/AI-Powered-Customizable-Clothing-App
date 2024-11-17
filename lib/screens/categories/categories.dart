import 'package:flutter/material.dart';
import 'category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            color: Theme.of(context).colorScheme.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {}, // Add an onPressed callback
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {}, // Add an onPressed callback
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Category(
                      'BIG FASHION FESTIVAL',
                      'Top Offers, Apparel, Footwear',
                      const ['Top Offers', 'Men', 'Women', 'Kids', 'Festive'],
                      Colors.yellowAccent.shade100),
                  Category(
                      'WOMEN',
                      'Kurtas & Suits, Top & Tees',
                      const [
                        'Westernwear',
                        'Ethnicwear',
                        'Bags, Wallets & Clutches',
                        'Jewellery'
                      ],
                      Colors.pinkAccent.shade100),
                  Category(
                      'MEN',
                      'T-Shirts, Shirts, Jeans',
                      const ['Topwear', 'Footwear', 'Watches', 'Sports & Activewear'],
                      Colors.orangeAccent.shade100),
                  Category(
                      'KIDS',
                      'Brands, Clothing, Footwear',
                      const ['Explore Kids Store', 'Infants', 'Masks'],
                      Colors.purpleAccent.shade100),
                  Category(
                      'FASHION MALL',
                      'H&M, Nike, Smashbox',
                      const ['Explore Fashion Mall', 'Casio', 'HRX', 'Nike', 'Wrogn'],
                      Colors.pink.shade100),
                  Category(
                      'GADGETS',
                      'Headphones, Smart wearables',
                      const [
                        'Smart Wearables',
                        'Audio & Hearables',
                        'Mobile Accessories'
                      ],
                      Colors.teal.shade100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
