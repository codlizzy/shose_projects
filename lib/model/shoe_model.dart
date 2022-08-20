import 'package:flutter/material.dart';

class Model {
  final image;
  final title;
  final price;
  final color;
  Model({this.image, this.title, this.price, this.color});
}

List<Model> shoemodel = [
  Model(
      image: 'assets/images/1.png',
      title: 'Air Force 1',
      price: '\$78',
      color: Colors.red),
  Model(
      image: 'assets/images/2.png',
      title: 'Air Max 1',
      price: '\$99.9',
      color: Colors.blue),
  Model(
      image: 'assets/images/3.png',
      title: 'Air Jordan 1',
      price: '\$220',
      color: Colors.purple),
  Model(
      image: 'assets/images/4.png',
      title: 'Air Huarache',
      price: '\$120',
      color: Colors.amber),
  Model(
      image: 'assets/images/5.png',
      title: 'Nike Zoom',
      price: '\$56',
      color: Colors.indigoAccent),
  Model(
      image: 'assets/images/6.png',
      title: 'Nike Cortez',
      price: '\$340',
      color: Colors.pink),
  Model(
      image: 'assets/images/7.png',
      title: 'Air Jordan 11',
      price: '\$420',
      color: Colors.teal),
  Model(
      image: 'assets/images/8.png',
      title: 'Nike Air Max 90',
      price: '\$200',
      color: Colors.green),
  Model(
      image: 'assets/images/9.png',
      title: 'Nike Air Mag',
      price: '\$300',
      color: Colors.teal),
  Model(
      image: 'assets/images/10.png',
      title: 'Air Jordan 3',
      price: '\$210',
      color: Colors.amber),
  Model(
      image: 'assets/images/11.png',
      title: 'Nike Blazer',
      price: '\$330',
      color: Colors.blueAccent),
  Model(
      image: 'assets/images/12.png',
      title: 'Nike Dunk',
      price: '\$440',
      color: Colors.brown),
];
