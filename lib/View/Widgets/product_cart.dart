import 'package:flutter/material.dart';
import 'package:online_shop/Constant/colors.dart';
import 'package:online_shop/Constant/height_width.dart';
import 'package:online_shop/View/Widgets/text_style.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({
    super.key,
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
  });
  final String id;
  final String name;
  final String category;
  final String image;
  final String price;
  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width * 0.6,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: whiteColor,
                offset: const Offset(1, 1),
                blurRadius: 0.6,
                spreadRadius: 1)
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: height(0.23, context),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(widget.image),
                    )),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 30,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: textStyleWithHeight(
                            26, blackColor, FontWeight.bold, 1)),
                    Text(widget.category,
                        style: textStyleWithHeight(
                            16, greyColor, FontWeight.bold, 1.2))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.price,
                        style: textStyle(24, blackColor, FontWeight.w600)),
                    Row(
                      children: [
                        Text("Colors",
                            style: textStyle(18, greyColor, FontWeight.w500)),
                        const SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          shape: const CircleBorder(),
                          label: const Text(" "),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: blackColor,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
