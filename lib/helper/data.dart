import 'package:esports_now/models/categorymodel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = 'CS:GO';
  categoryModel.imageUrl =
      'https://cdn.mos.cms.futurecdn.net/5zHA4DXhWdQfiyaBKXeQyg.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'VALORANT';
  categoryModel.imageUrl =
      'https://images6.alphacoders.com/107/thumb-1920-1072679.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'DOTA 2';
  categoryModel.imageUrl =
      'https://cdn.akamai.steamstatic.com/steam/apps/570/ss_f9ebafedaf2d5cfb80ef1f74baa18eb08cad6494.1920x1080.jpg?t=1612665823';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'PUBG:M';
  categoryModel.imageUrl =
      'https://roonby.com/wp-content/uploads/2020/08/PUBG-Like-Game.jpg';
  category.add(categoryModel);

  return category;
}

List<CategoryModel> getClips() {
  List<CategoryModel> clips = [];
  CategoryModel clipsModel = CategoryModel();
  clipsModel.categoryName = 'CS:GO';
  clipsModel.imageUrl =
      'https://cdn.mos.cms.futurecdn.net/5zHA4DXhWdQfiyaBKXeQyg.jpg';
  clips.add(clipsModel);

  clipsModel = new CategoryModel();
  clipsModel.categoryName = 'VALORANT';
  clipsModel.imageUrl =
      'https://images6.alphacoders.com/107/thumb-1920-1072679.jpg';
  clips.add(clipsModel);

  clipsModel = new CategoryModel();
  clipsModel.categoryName = 'DOTA 2';
  clipsModel.imageUrl =
      'https://cdn.akamai.steamstatic.com/steam/apps/570/ss_f9ebafedaf2d5cfb80ef1f74baa18eb08cad6494.1920x1080.jpg?t=1612665823';
  clips.add(clipsModel);
  clipsModel = new CategoryModel();
  clipsModel.categoryName = 'PUBG:M';
  clipsModel.imageUrl =
      'https://roonby.com/wp-content/uploads/2020/08/PUBG-Like-Game.jpg';
  clips.add(clipsModel);

  return clips;
}
