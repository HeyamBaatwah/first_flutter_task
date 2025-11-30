import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> products = [
    'assets/iPhone.jpg',
    'assets/Pixel.jpg',
    'assets/Laptop.jpg',
    'assets/tablet.jpg',
    'assets/Pendrive.jpg',
    'assets/headphone.jpg',
    'assets/mouse.jpg',
    'assets/airpod.jpg',
    'assets/camera.jpg',
    'assets/powerbank.jpg',
    'assets/stwatche.jpg',
    'assets/earphone.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(title: Text('Products', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),), backgroundColor: Color(0xfff1f1f1), centerTitle: true,),
      body: ListView.builder(
        itemCount: (products.length/2).toInt(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductCard(product: products[index*2]),
                ProductCard(product: products[index*2+1]),
              ],
            ),
          );
        }
      )
    );
  }
}


class ProductCard extends StatelessWidget {
  final String product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 180,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.asset(product, fit: BoxFit.contain,),
            Positioned(
                bottom: 10,
                right: 10,
                child: LikeButton()
            )
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key,});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isLiked? Icon(Icons.favorite_rounded, size: 35, color: Colors.red,) : Icon(Icons.favorite_outline_rounded, size: 35, color: Colors.black54,),
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
    );
  }
}
