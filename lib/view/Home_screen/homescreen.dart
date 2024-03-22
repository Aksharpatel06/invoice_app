import 'package:flutter/material.dart';
import 'package:invoice_app/view/product_data/product_data.dart';

import '../../utils/productdetials.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        title: Text('Invoice Generator',style: TextStyle(color: Colors.white)),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
              });
              Navigator.of(context).pushNamed('/pdf');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('view',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:List.generate(productdetails.length, (index) => product(index,context))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/data');
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Widget product(int index,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Product name:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      Text(productdetails[index]['name'],style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Quatity:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                      Text('${productdetails[index]['quatity']}',style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Prize:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                      Text('${productdetails[index]['prize']}',style: TextStyle(fontSize: 12,),)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      isedit = true;
                      Navigator.of(context).pushNamed('/data',arguments: index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xff76ABAE),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      height: 30,
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit,size: 15,),
                          Text('Edit'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                      });
                      productdetails.removeAt(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffE72929),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      height: 30,
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete,size: 15,),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
