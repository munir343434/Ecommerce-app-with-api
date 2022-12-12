// class Recommend {
//   int? _totalSize;
//   int? _typeId;
//   int? _offset;
//  late  List<RecommendProductsModel> _products;
//   List<RecommendProductsModel> get recommend => _products;

//   Recommend(
//       {required totalSize,
//       required typeId,
//       required offset,
//       required products}) {
//     this._totalSize = totalSize;
//     this._typeId = typeId;
//     this._offset = offset;
//     this._products = products;


//   }

//   Recommend.fromJson(Map<String, dynamic> json) {
//     _totalSize = json['total_size'];
//     _typeId = json['type_id'];
//     _offset = json['offset'];
//     if (json['products'] != null) {
//       _products = <RecommendProductsModel>[];
//       json['products'].forEach((v) {
//         _products.add(RecommendProductsModel.fromJson(v));
//       });
//     }
//   }
// }

// class RecommendProductsModel {
//   int? id;
//   String? name;
//   String? description;
//   int? price;
//   int? stars;
//   String? img;
//   String? location;
//   String? createdAt;
//   String? updatedAt;
//   int? typeId;

//   RecommendProductsModel(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.stars,
//       this.img,
//       this.location,
//       this.createdAt,
//       this.updatedAt,
//       this.typeId});

//   RecommendProductsModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     stars = json['stars'];
//     img = json['img'];
//     location = json['location'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     typeId = json['type_id'];
//   }
// }
