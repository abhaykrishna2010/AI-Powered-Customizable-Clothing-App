import 'package:flutter/material.dart';
import '../products/product_list.dart';

class Category extends StatefulWidget {
  final String categoryName;
  final String categoryDescription;
  final List<String> subCategories;
  final Color backgroundColor;

  const Category(this.categoryName, this.categoryDescription, this.subCategories,
      this.backgroundColor, {super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              color: widget.backgroundColor,
              width: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).padding.left -
                      MediaQuery.of(context).padding.right) *
                  1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.categoryName,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.categoryDescription,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isExpanded)
          ...widget.subCategories.map((e) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ProductList.routeName);
              },
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Text(
                    e,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          }),
      ],
    );
  }
}
