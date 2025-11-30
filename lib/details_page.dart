import 'package:first_task/product_list.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(title: Text('Details', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),), backgroundColor: Color(0xfff1f1f1), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Text('Description', style: TextStyle(color: Colors.black, fontSize: 20,),),
                  Text(product.details, style: TextStyle(color: Colors.black54, fontSize: 20,),  softWrap: true,),
                ],
              ),
              Column(
                children: [
                  Divider(color: Colors.grey, thickness: 2,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price', style: TextStyle(color: Colors.black54, fontSize: 20,),),
                          SizedBox(height: 5,),
                          Text('${product.price}\$', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 170,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text('ADD TO CART', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
