// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class TrendingNewstile extends StatelessWidget {
//   final String title;
//   final String description;
//   final String image;
//   const TrendingNewstile(
//       {super.key,
//       required this.title,
//       required this.description,
//       required this.image});

//   @override
//   Widget build(BuildContext context) {
//     final Uri _url = Uri.parse('https://flutter.dev');

//     Future<void> _launchUrl() async {
//       if (!await launchUrl(_url)) {
//         // Show a Snackbar if URL can't be launched
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Could not launch $_url'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     }

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: GestureDetector(
//         onTap: _launchUrl,
//         child: Card(
//           child: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     image,
//                     height: 100,
//                     errorBuilder: (context, error, stackTrace) => Icon(
//                       Icons.error,
//                       size: 50,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         description,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(color: Colors.grey),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrendingNewstile extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Function()? onTap;
  const TrendingNewstile({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }
}
