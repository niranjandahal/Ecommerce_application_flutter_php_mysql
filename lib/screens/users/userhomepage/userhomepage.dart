import 'package:flutter/material.dart';
import 'package:r11seproject/Provider/category-provider.dart';
import 'package:provider/provider.dart';
import 'package:r11seproject/routes/routes.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    print('scaffold widget build');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //search bar
              Container(
                height: 80,
                child: Row(
                  children: [
                    //qr code on left side and a sepearte beautiful seach bar
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.white,
                        ),
                        child: Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.search,
                                size: 40,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search for products",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Text(
                  "All Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 300,
                child: Consumer<CategoryProvider>(
                  builder: (context, _allproductprovider, child) {
                    if (_allproductprovider.alldata == null ||
                        _allproductprovider.alldata.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print(_allproductprovider.alldata.length);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _allproductprovider.alldata.length ?? 0,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "$productimageurl${_allproductprovider.alldata[index]['product_image']}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, right: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              _allproductprovider.alldata[index]
                                                      ['product_name'] ??
                                                  '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              _allproductprovider.alldata[index]
                                                      ['product_price'] ??
                                                  '',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          print(_allproductprovider
                                                  .alldata[index] ??
                                              '');
                                        },
                                        child: Icon(
                                          Icons.shopping_cart,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              //listen to change in provider and rebuild
              Consumer<CategoryProvider>(
                builder: (context, _categoryprovider, child) {
                  print('category list widget build');
                  if (_categoryprovider.catkeys == null ||
                      _categoryprovider.catkeys.isEmpty) {
                    return const CircularProgressIndicator();
                  } else {
                    return SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categoryprovider.catkeys.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _categoryprovider.ShowCatData(
                                  _categoryprovider.catkeys[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 70,
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  _categoryprovider.catkeys[index] ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              Container(
                height: 300,
                child: Consumer<CategoryProvider>(
                  builder: (context, _categoryprovider, child) {
                    if (_categoryprovider.showcatdata == null ||
                        _categoryprovider.showcatdata.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _categoryprovider.showcatdata.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "$productimageurl${_categoryprovider.showcatdata[index]['product_image']}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, right: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              _categoryprovider
                                                          .showcatdata[index]
                                                      ['product_name'] ??
                                                  '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              _categoryprovider
                                                          .showcatdata[index]
                                                      ['product_price'] ??
                                                  '',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          print(_categoryprovider
                                                  .showcatdata[index] ??
                                              '');
                                        },
                                        child: Icon(
                                          Icons.shopping_cart,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Container(
                  height: 200,
                  child: Center(
                    child: Text("many more coming soon !!"),
                  ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.home,
                  size: 35,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.message,
                  size: 35,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
