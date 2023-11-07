import 'package:flutter/material.dart';

import 'package:movieapp/features/browse/view/categoryDM.dart';

class CategoryItem extends StatefulWidget {
CategoryDM categoryDM;
int index;


CategoryItem({required this.categoryDM, required this.index});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(widget.categoryDM.image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.8,
              colorBlendMode: BlendMode.darken,
              color: Colors.grey,
            ),
            Text(widget.categoryDM.name??'',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
  )
    );
  }


}
