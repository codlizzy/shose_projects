import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shose_projects/model/shoe_model.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'Navbar.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _myActive(String str) {
    return Row(
      children: [
        Text(
          str,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black54),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Navbar(),
      backgroundColor: Colors.black,
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 290),
          child: (Icon(Icons.shopping_bag)),
        ),
      ),
      // sliding Widget
      body: SlidingSheet(
        elevation: 0,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Column(
          children: [
            // background image
            Image.asset('assets/images/2.png'),
          ],
        ),
        builder: (context, state) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _myActive('Best shoe'),
                    _myActive('Best Nike'),
                    _myActive('Best select'),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'category',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.linear_scale_sharp),
                  ),
                ],
              ),
              Container(
                height: height * 2,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                // GridView
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: shoemodel.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Card(
                            child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Flexible(
                              flex: 7,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                                index: index,
                                              )));
                                },
                                child: Image.asset(
                                  shoemodel[index].image,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                shoemodel[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // const SizedBox(
                            //   height: 7,
                            // ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      shoemodel[index].price,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 19,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
