import 'package:flutter/material.dart';

import '../../utils/productdetials.dart';

class productdata extends StatefulWidget {
  const productdata({super.key});

  @override
  State<productdata> createState() => _productdataState();
}

bool isedit = false;



TextEditingController txtname = TextEditingController();
TextEditingController txtprize = TextEditingController();
TextEditingController txtquatity = TextEditingController();

class _productdataState extends State<productdata> {
  @override
  Widget build(BuildContext context) {

    int count = (isedit)?ModalRoute.of(context)!.settings.arguments as int:10;

    txtname=TextEditingController(text:(isedit)?productdetails[count]['name']:'balaji');
    txtprize=TextEditingController(text:(isedit)?productdetails[count]['prize'].toString():'588');
    txtquatity=TextEditingController(text:(isedit)?productdetails[count]['quatity'].toString():'2');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: txtname,
              decoration: InputDecoration(
                labelText: 'Product name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: txtprize,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Prize',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: txtquatity,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Quatity',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 20,),
            (!isedit)?InkWell(
              onTap: () {
                setState(() {
                });
                Map data ={
                  'name':txtname.text,
                  'prize':double.parse(txtprize.text),
                  'quatity':int.parse(txtquatity.text),
                };
                productdetails.add(data);
                Navigator.of(context).pushNamed('/').then((value) =>
                    setState(() {
                    }),
                );
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text('Add to product',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
              ),
            ):InkWell(
              onTap: () {
                setState(() {
                });
                productdetails[count]['name'] = txtname;
                productdetails[count]['prize'] = txtprize;
                productdetails[count]['quatity'] = txtquatity;
                Navigator.of(context).pop();
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text('Save',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
