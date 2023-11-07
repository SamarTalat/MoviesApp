import 'package:flutter/material.dart';
import 'package:movieapp/features/browse/view/categoryDM.dart';
import 'package:movieapp/features/browse/view/category_item.dart';
import 'package:movieapp/features/browse/view/category_result.dart';
import 'package:movieapp/models/categoryResponce.dart';
import 'package:movieapp/services/api_services.dart';

class BrowseScreen extends StatefulWidget {
  static const String routeName = 'category-screen';
  var categoryList=CategoryDM.getCategories();

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();

}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Browse Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder<CategoryResponce>(
              future: ApiService.getCategoryMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                          color: Colors.lightBlueAccent));
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text('some thing went wrong'),
                      ElevatedButton(
                          onPressed: () {
                            ApiService.getCategoryMovies();
                            setState(() {});
                          },
                          child: Text('try again'))
                    ],
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryItem(categoryDM: widget.categoryList[index],index: index);
                    },
                    itemCount: widget.categoryList.length,
                  ),
                );
              },
            )
          ])),
    );
  }

}

