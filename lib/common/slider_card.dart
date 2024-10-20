import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String sliderText;
  final String sliderImage;
  const SliderCard(
      {super.key, required this.sliderText, required this.sliderImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            sliderImage,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, object, stackTree) {
              return Container(
                color: Colors.grey,
                child: Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 50,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: 200,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Center(
              child: Text(
                sliderText,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
