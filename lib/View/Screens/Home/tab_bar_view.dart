import 'package:flutter/material.dart';
import 'package:online_shop/View/Widgets/product_cart.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/height_width.dart';
import '../../../Model/sneakers.dart';
import '../../Widgets/text_style.dart';

class TabView extends StatefulWidget {
  const TabView({super.key, required this.sneakers});

  final Future<List<Sneaker>> sneakers;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneaker>>(
      future: widget.sneakers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              children: [
                SizedBox(
                    height: height(
                      0.405,
                      context,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final sneaker = snapshot.data![index];
                          return ProductCart(
                            id: sneaker.id,
                            name: sneaker.name,
                            category: sneaker.category,
                            image: sneaker.imageUrl[0],
                            price: "\$${sneaker.price}",
                          );
                        })),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest Shoe's",
                            style: textStyle(23, whiteColor, FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  "Show all",
                                  style: textStyle(
                                      15, whiteColor, FontWeight.w600),
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: whiteColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height(0.14, context),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 12,
                                width: MediaQuery.sizeOf(context).width * 0.30,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data![index].imageUrl[1]),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: whiteColor,
                                          offset: const Offset(1, 0),
                                          spreadRadius: 0.5,
                                          blurRadius: 0.2)
                                    ]),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
