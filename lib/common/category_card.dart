import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category_name;
  final String category_image;
  const CategoryCard(
      {super.key, required this.category_name, required this.category_image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                category_image,
                height: 80,
                width: 130,
                fit: BoxFit.cover,
              )),
          Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(10)),
          ),
          Text(
            category_name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
