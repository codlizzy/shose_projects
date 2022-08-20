import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shose_projects/clipath.dart';
import 'package:shose_projects/model/shoe_model.dart';

class DetailsPage extends StatefulWidget {
  int index;
  DetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: shoemodel[widget.index].color,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        color: shoemodel[widget.index].color,
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                color: shoemodel[widget.index].color,
                height: height * .7,
                width: width,
                child: ClipPath(
                  clipper: AppClipper(
                      cornerSize: 50, diagonalHeight: 180, rundedBottom: false),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 180),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: 400,
                          child: Text(
                            shoemodel[widget.index].title,
                            style: const TextStyle(fontSize: 36),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 22,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 300),
                          child: Text(
                            'DETAILS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Nike Air Jordans are beyond iconic - these retro sneakers were produced exclusively for Michael Jordan in 1984. The highly anticipated ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 220),
                          child: Text(
                            'COLOR OPTIONS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            builderColor(Colors.blue),
                            builderColor(Colors.red),
                            builderColor(Colors.green),
                            builderColor(Colors.purple),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: buildBottom(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image(
                  width: width * .9,
                  image: AssetImage(shoemodel[widget.index].image)),
            ),
          ],
        ),
      ),
    );
  }

  Container buildBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
              Text(
                shoemodel[widget.index].price,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              decoration: BoxDecoration(
                  color: shoemodel[widget.index].color,
                  borderRadius: BorderRadius.circular(50)),
              child: const Text(
                'Card',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  Widget builderColor(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
    );
  }
}
