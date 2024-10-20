import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingNewstile extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const TrendingNewstile(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.error,
                    size: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
