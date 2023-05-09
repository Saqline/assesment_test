import 'package:assesment_test/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Details extends StatelessWidget {
  Datum dataModel;
   String baseurl = 'https://admin.cashsmarts.co.uk';
  Details(this.dataModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Details"),),),
      body: Column(
        children: [
          
           SizedBox(
                height: 350,
                child: ListView.separated(
                  padding: EdgeInsets.all(12),
                  scrollDirection: Axis.vertical,
                  itemCount:1,
                  itemBuilder: (_, index) {
                    return dataModel.highlight == 1 ?
                    Title(
                        color: Colors.black,
                        child: Column(
                          children: [
                            Text(
                              "Id No : ${dataModel.idNo}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Vat No : ${dataModel.vatNo}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Reg No : ${dataModel.regNo}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Category : ${dataModel.category}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bussiness Name : ${dataModel.businessName}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Email : ${dataModel.email}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            Text(
                              "Phone No : ${dataModel.phone}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Note : ${dataModel.note}",
                              style: TextStyle(color: Colors.brown),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.network(
                                "$baseurl${dataModel.backgroundImagePath}",height: 80,width: 80,),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )):Text('');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return dataModel.highlight == 1 ? SizedBox(
                       width: 12,
                    ):SizedBox(height: 0,);
                 },
                ),
              ),
        ],
      ),
    );
  }
}
