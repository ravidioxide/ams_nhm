import 'package:flutter/material.dart';

class Rating extends StatefulWidget {

  final int maximumRating;
  final Function(int)onRatingSelected;

  Rating(this.onRatingSelected,[this.maximumRating = 5]);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Text('');
  }
}
