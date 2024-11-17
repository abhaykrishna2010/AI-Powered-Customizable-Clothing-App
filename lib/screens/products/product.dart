import 'package:flutter/material.dart';
import '../../common_widgets/cached_image.dart';
import '../../data_provider/product_dto.dart';
import 'product_details.dart';

class Product extends StatefulWidget {
  final ProductDto productDto;

  const Product(this.productDto, {super.key});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetails.routeName);
      },
      child: Builder(
        builder: (ctx) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: CachedImage(
                  url: widget.productDto.imageUrl,
                  height: 100.0, // Specify the height as per your design needs
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.productDto.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          isWishlist
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isWishlist = !isWishlist;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      isWishlist = !isWishlist;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                  ),
                                ),
                        ],
                      ),
                      Text(
                        widget.productDto.description,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '₹ ${widget.productDto.price}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '₹ ${widget.productDto.mrpPrice}',
                            style: const TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            widget.productDto.discountString,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 144, 90, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
