import 'package:flutter/material.dart';

import 'package:movieapp/features/browse/view/categoryDM.dart';
import 'package:movieapp/features/browse/view/movie_item.dart';
import 'package:movieapp/models/movieModel.dart';
import 'package:movieapp/services/api_services.dart';
class CategoryResult extends StatefulWidget {
  static const routeName = 'category-result';
  late CategoryDM categoryDM;
  @override
  State<CategoryResult> createState() => _CategoryResultState();
}

class _CategoryResultState extends State<CategoryResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        centerTitle: true,
        title: Text('category',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          FutureBuilder<MovieModel>(
            future: ApiService.getMoveByGenerId(widget.categoryDM.id),
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
                          ApiService.getMoveByGenerId(widget.categoryDM.id);
                          setState(() {});
                        },
                        child: Text('try again'))
                  ],
                );
              }
              var movieList=snapshot.data?.results ??[];
              print(movieList);

              return
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    itemCount: movieList.length,
                      itemBuilder: (context,index){
                      print(movieList[index].title);
                        return
                          movieItem(movie: movieList[index]);
                      }
                      ),

                );
            },
          ),

        ],

      ),
    );
  }
}
