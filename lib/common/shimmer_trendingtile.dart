import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTrendingtile extends StatelessWidget {
  const ShimmerTrendingtile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 150,
                  width: 150,
                  color: Colors.white,
                ),
                title: Container(
                  height: 50,
                  color: Colors.white,
                ),
                subtitle: Container(
                  height: 50,
                  color: Colors.white,
                ),
              );
            }),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100);
  }
}
