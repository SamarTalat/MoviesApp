class CategoryDM{
  String id;
  String name;
  String image;
  CategoryDM({required this.name,required this.image,required this.id});
  static List<CategoryDM>getCategories(){
    return [
      CategoryDM(name: 'Action', image: 'assets/images/action.png', id: '28'),
      CategoryDM(name: 'Adventure', image: 'assets/images/adventure.png', id: '12'),
      CategoryDM(name: 'Animation', image: 'assets/images/animation.png', id: '16'),
      CategoryDM(name: 'Comedy', image: 'assets/images/comedy.png', id: '35'),
      CategoryDM(name: 'Crime', image: 'assets/images/crime.png', id: '80'),
      CategoryDM(name:"Documentary",image: 'assets/images/documentry.png',id:'99',),
      CategoryDM(name:"Drama",image: 'assets/images/mysteryy.png',id:'18',),
      CategoryDM(name:"Family",image: 'assets/images/fammily.png',id:'10751'),
      CategoryDM(name:"Fantasy",image: 'assets/images/fantasy.png',id:'14'),
      CategoryDM(name:"History",image: 'assets/images/history.png',id:'36'),
      CategoryDM(name:"Horror",image: 'assets/images/horror.png',id:'27'),
      CategoryDM(name:"Music",image: 'assets/images/music.png',id:'10402',),
      CategoryDM(name:"Mystery",image: 'assets/images/mystery.png',id:'9648'),
      CategoryDM(name:"Romance",image: 'assets/images/rromance.png',id:'10749'),
      CategoryDM(name:"Science Fiction",image: 'assets/images/sciencefiction.png',id:'878'),
      CategoryDM(name:"TV Movie",image: 'assets/images/tvmovie.png',id:'10770'),
      CategoryDM(name:"Thriller",image: 'assets/images/trailler.png',id:'53'),
      CategoryDM(name:"War",image: 'assets/images/wwaarr.png',id:'10752'),
      CategoryDM(name:"Western",image: 'assets/images/wwastern.png',id:'37'),

    ];
}
}