import 'package:first_task/details_page.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List products = [
    Product(image: 'assets/iPhone.jpg', name: 'iPhone', details: 'iPhone is the stylist phone ever', price: 1000),
    Product(image: 'assets/Pixel.jpg', name: 'Pixel', details: 'Pixel is the most featureful phone ever', price: 800),
    Product(image: 'assets/Laptop.jpg', name: 'Laptop', details: 'Laptop is most productive development tool', price: 2000),
    Product(image: 'assets/tablet.jpg', name: 'Tablet', details: 'Tablet is the most useful device ever for meeting', price: 1500),
    Product(image: 'assets/Pendrive.jpg', name: 'Pendrive', details: 'Pendrive is the most portable storage device', price: 100,),
    Product(image: 'assets/headphone.jpg', name: 'Headphone', details: 'Headphone gives the best music experience', price: 200,),
    Product(image: 'assets/mouse.jpg', name: 'Mouse', details: 'Mouse is the most essential tool for navigation', price: 50,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(title: Text('Product Listing', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),), backgroundColor: Color(0xfff1f1f1), centerTitle: true,),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        }
      )
    );
  }
}

class Product {
  final String image;
  final String name;
  final String details;
  final double price;
  const Product({
    required this.image,
    required this.name,
    required this.details,
    required this.price
});
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: product,)));
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding:  EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset(product.image),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(product.details, style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),  softWrap: true,),
                  Text('Price: ${product.price}\$', style: TextStyle(color: Colors.black, fontSize: 15,),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
