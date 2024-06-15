class Product {
  final String imgUrl;
  final bool isFav;
  final int prize;
  final String productId;
  final String productName;
  final int review;
  final String weight;  
  final String productdetail;
  Product({
    required this.imgUrl,
    required this.isFav,
    required this.prize,
    required this.productId,
    required this.productName,
    required this.review,
    required this.weight,
    required this.productdetail,
  });
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      imgUrl: data['imgurl'] ?? '',
      isFav: data['isFav'] ?? false,
      prize: data['prize'],
      productId: data['productId'] ?? '',
      productName: data['productname'] ?? '',
      review: data['review'] ?? '',
      weight: data['weight'] ?? '',
      productdetail: data['productdetail'] ?? '',
    );
  }
}