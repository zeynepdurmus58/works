import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

//home ekranındaki kategorilerin widget'ı
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("Tıklandı"),
      child: Container(
        child: Text(category),
      ),
    );
  }
}