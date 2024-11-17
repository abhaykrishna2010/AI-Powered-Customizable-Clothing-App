import 'package:flutter/material.dart';
import '../common_widgets/cached_image.dart';
import '../data_provider/home_data.dart';
import '../utils/asset_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: const Color.fromARGB(255,240,190,190),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                    const Text(
                      'Fille Sans Peur',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: HomeData.getTopbarAssets()
                  .map((e) => CachedImage(
                        url: e,
                        height: 89,
                        width: 76,
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  CachedImage(url: banner1, height: 361),
                  const SizedBox(height: 15),
                  CachedImage(url: free_shipping, height: 47),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CachedImage(
                          url: banner2,
                          height: 360,
                        ),
                      ),
                      Expanded(
                        child: CachedImage(
                          url: banner3,
                          height: 360,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CachedImage(url: biggest_offers, height: 63),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 275,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: HomeData.getBiggestOffers()
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: CachedImage(
                                  url: e,
                                  height: 273,
                                  width: 179,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CachedImage(url: best_offers, height: 63),
                  const SizedBox(height: 15),
                  buildOfferCard(context, kurta_offer, flipflop_offer, watch_offer, loungewear_offer),
                  const SizedBox(height: 15),
                  CachedImage(url: festive_deals, height: 63),
                  const SizedBox(height: 15),
                  buildOfferCard(context, seventy_off, under_399, buy_1_get_1, sixty_off),
                  const SizedBox(height: 15),
                  CachedImage(url: daily_deals, height: 63),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 265,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: HomeData.getDailyDeals()
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: CachedImage(
                                  url: e,
                                  height: 260,
                                  width: 171,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CachedImage(url: featured_brands, height: 63),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 360,
                    child: CarouselSlider.builder(
                      itemCount: HomeData.getFeaturedBrands().length,
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        List<String> featuredBrands = HomeData.getFeaturedBrands();
                        return CachedImage(
                          url: featuredBrands[index],
                          height: 100,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1.0,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 50,
                    child: const Divider(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '"The great thing about fashion is that it always looks forward"',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Oscar De La Renta',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOfferCard(BuildContext context, String offer1, String offer2,
      String offer3, String offer4) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CachedImage(
                  url: offer1,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
                CachedImage(
                  url: offer2,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CachedImage(
                  url: offer3,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
                CachedImage(
                  url: offer4,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
