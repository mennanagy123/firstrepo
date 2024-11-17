class ProductModel{
  String img;
  String name;
  String description;
  num price;
  ProductModel({
    required this.img,
    required this.name,
    required this.description,
    required this.price
});
  factory ProductModel.fromJson(Map<String,dynamic>json,int index){
    return ProductModel(
        img: json["data"]["products"][index]["image"],
        name: json["data"]["products"][index]["name"],
        description: json["data"]["products"][index]["description"],
        price: json["data"]["products"][index]["price"]);
  }
}