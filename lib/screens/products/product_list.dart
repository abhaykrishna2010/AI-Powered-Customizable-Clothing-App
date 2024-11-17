import 'package:flutter/material.dart';
import '../../common_widgets/back_button.dart' as bb;
import '../../data_provider/product_data.dart';
import '../../data_provider/product_dto.dart';
import 'product.dart'; // Ensure Product is correctly defined

class ProductList extends StatelessWidget {
  static const routeName = '/products';

  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductDto> products = ProductData.getProductsListData();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              color: const Color.fromARGB(255, 240, 190, 190),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      bb.BackButton(), // Ensure this widget is defined properly
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wrogn-Tshirts',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '1612 items',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Add functionality for search button
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Add functionality for favorite button
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Add functionality for shopping bag button
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Product(products[index]); // Ensure Product widget is defined correctly
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
