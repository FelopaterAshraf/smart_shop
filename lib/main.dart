import 'dart:convert';

import 'package:flutter/material.dart';

void main(){
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(          // w hna (1)
    debugShowCheckedModeBanner: false,
      home:MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
    MyHomePage({super.key});             //mn hna (1)
    //leh lma zwdna list ms7na const (1)
  List<Product> products  = [
    Product(name: 'Nikon 600D Mirrorless', price: 344.99,recommendation:'+100 recommendations',thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWOpQVeSoH4LJihZJ8dLIiT0G2uW0Q3KY0CA&usqp=CAU'),
    Product(name: 'WJPILIS Smart Weist Watch', price: 199.99,recommendation:'+890 recommendations',thumbnail:'https://m.media-amazon.com/images/I/51yQ+ejKpiL.jpg'),
    Product(name: 'Amazon Echo LooK', price: 349.99,recommendation:'+400 recommendations',thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlm41stuaaFW6yDyTfqOF-iz9NiVXuwpY0EQ&usqp=CAU'),
    Product(name: 'Amazon Echo LooK ', price: 349.99,recommendation:'+700 recommendations',thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEtoX8qtr0dNPP2HeU5_yMhU5APSJ0H2fNJw&usqp=CAU'),
    ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(246, 243, 243, 251),
      appBar:
      AppBar(
        title:
        const Text("Smart Shop",
            style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.w900,fontSize:28 )
        ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          actions: <Widget>[
      IconButton(
      icon: const Icon(Icons.add_shopping_cart),
      tooltip: 'My Cart Icon',
      onPressed: () {},
      ),
          ]
      ),
      body:
        ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute (
                  builder: (BuildContext context) => NextPage(
                  input1 : products[index].price,
                  ),
                  ),
                );
              },
              child:AddProduct(
              product: products[index],
              ),
            );
          }
        ),
      );
  }
}

class Product {
  String name;
  double price;
  String thumbnail;
  String recommendation;

  Product({
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.recommendation,
  });
}

class AddProduct extends StatelessWidget {
  final Product product;

  const AddProduct({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    double x=product.price;
    String y="\$$x";
    return
      Container(
        decoration:BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(20)
        ) ,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(height: 100,
                width: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                    image: DecorationImage(fit: BoxFit.fill,
                        image: NetworkImage(
                          product.thumbnail
                        )
                    )
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                      product.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize:17,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Text(y,
                  style: const TextStyle( fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.w700),

                ),
                SizedBox.fromSize(size: const Size(10, 30),),
                Text(product.recommendation,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),

                ),
              ],
            ),
          ],
        ),
      );
  }

}



class NextPage extends StatefulWidget {
  final double input1;
  const NextPage({super.key, required this.input1});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  double input1 = 0;
  double sum = 0;

  void plus5(){
    setState(() {
      sum= input1 + 5 ;
      input1 =sum;
    });
  }

  @override
  void initState()
  {
    input1= widget.input1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.input1.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(30),
          ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                  input1.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800)
    ),
            ),
              ),
    const SizedBox(height:10,),
    ElevatedButton(
      style:
        ElevatedButton.styleFrom(
            backgroundColor:Colors.pinkAccent,
        maximumSize: const Size(200, 50)
            ),
      onPressed: (){
          plus5();
      },
        child:
          const Text('+\$5',
            style: TextStyle(fontWeight: FontWeight.w900,
              fontSize:20),
                ),
          ),
        ]
        )
    );
  }
}

