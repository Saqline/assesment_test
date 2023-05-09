import 'package:assesment_test/pages/details.dart';
import 'package:assesment_test/pages/login_page.dart';
import 'package:assesment_test/model/dataModel.dart';
import 'package:assesment_test/provider/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  static String route = '/home';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   DataModel? dataModel;
  bool isLoaded = false;

  getData() async {
    dataModel = (await DataProvider().getData())!;

    setState(() {
      isLoaded = true;
    });
  }

  String baseurl = 'https://admin.cashsmarts.co.uk';
  

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('DashBoard')),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Highlight = 1 are:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 3,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(12),
                  scrollDirection: Axis.horizontal,
                  itemCount: dataModel?.data.length ?? 0,
                  itemBuilder: (_, index) {
                    return dataModel?.data[index].highlight == 1
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Id No:${dataModel?.data[index].idNo ?? 0}"),
                                ElevatedButton(
                                  onPressed: () async{
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                dataModel!.data[index])));
                                  
                
                                  },
                                  child: Text(
                                    "Click for More Details",
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text('');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return dataModel?.data[index].highlight == 1
                        ? SizedBox(
                            width: 12,
                          )
                        : SizedBox(
                            height: 0,
                          );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Highlight = 0 are:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 3,
              ),
              SizedBox(
                height: 350,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(12),
                  scrollDirection: Axis.vertical,
                  itemCount: dataModel?.data.length?? 0,
                  itemBuilder: (_, index) {
                    return dataModel?.data[index].highlight == 0
                        ? Title(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Text(
                                  "Id No : ${dataModel?.data[index].idNo ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Vat No : ${dataModel?.data[index].vatNo ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Reg No : ${dataModel?.data[index].regNo ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Category : ${dataModel?.data[index].category ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Bussiness Name : ${dataModel?.data[index].businessName ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Email :${dataModel?.data[index].email ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                Text(
                                  "Phone No : ${dataModel?.data[index].phone ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Note $index: ${dataModel?.data[index].note ?? 0}",
                                  style: TextStyle(color: Colors.brown),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                  "$baseurl${dataModel?.data[index].backgroundImagePath ?? 0}",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ))
                        : Text('');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return dataModel?.data[index].highlight  == 0
                        ? SizedBox(
                            width: 12,
                          )
                        : SizedBox(
                            height: 0,
                          );
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                height: 4,
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => (LoginScreen()),
                        ),
                      );
                    },
                    child: Text("Logout")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
