class Food {
  String name;
  String price;
  String imgpath;

  Food({required this.name, required this.price, required this.imgpath});
  String get _name => name;
  String get _price => price;
  String get _imgpath => imgpath;
}
