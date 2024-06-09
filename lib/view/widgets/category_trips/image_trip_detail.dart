import 'package:flutter/material.dart';

class ImageTripDetail extends StatelessWidget {
  const ImageTripDetail({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
