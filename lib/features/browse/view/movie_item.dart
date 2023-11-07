import 'package:flutter/material.dart';

import 'package:movieapp/models/movieModel.dart';

class movieItem extends StatefulWidget {
Movie movie;
movieItem({required this.movie});

  @override
  State<movieItem> createState() => _movieItemState();
}

class _movieItemState extends State<movieItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/action.png'),
        Text(widget.movie.title??''),
      ],

    );
  }
}
