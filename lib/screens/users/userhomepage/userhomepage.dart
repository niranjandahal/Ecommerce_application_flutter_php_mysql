import 'package:flutter/material.dart';
import 'package:r11seproject/Provider/category-provider.dart';
import 'package:provider/provider.dart';

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
        body: Column(
          children: [
            SizedBox(
                height: 50,
                child: Text("All Products",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Expanded(
              flex: 1,
              child: Consumer<CategoryProvider>(
                builder: (context, _allproductprovider, child) {
                  if (_allproductprovider.alldata == null ||
                      _allproductprovider.alldata.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _allproductprovider.alldata.length ?? 0,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/200/300"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              flex: 5,
                            ),
                            Expanded(
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
                              flex: 1,
                            ),
                          ]);
                        });
                  }
                },
              ),
            ),
            //listen to change in provider and rebuild
            Consumer<CategoryProvider>(
                builder: (context, _categoryprovider, child) {
              print('catedoy list widget build');
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
                              print(_categoryprovider.catkeys[index]);
                              print(_categoryprovider.showcatdata.length);
                              print(index);
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
                                      // color: Colors.black,
                                    ),
                                  )),
                            ));
                      }),
                );
              }
            }),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
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
                              return Column(children: [
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
                                              "https://picsum.photos/200/300"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
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
                              ]);
                            },
                          );
                        }
                      }),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
