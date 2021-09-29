class Product {
  final String? image, title;
  final int? cost, discount, stars, rating;
  Product(
      {this.image,
      this.title,
      this.cost,
      this.discount,
      this.stars,
      this.rating});
}

var productData = [
  Product(
      image:
          "https://images-na.ssl-images-amazon.com/images/I/81XGKSHCEeL._SL1486_.jpg",
      title: "Zorbes Light 8 Side Bait Fishing Trap, Portable...",
      cost: 799,
      discount: 44,
      stars: 3,
      rating: 182),
  Product(
      image:
          "https://images-na.ssl-images-amazon.com/images/I/71PUT7madMS._SL1500_.jpg",
      title: "Proberos® Fishing Net, Super Robust...",
      cost: 1239,
      discount: 51,
      stars: 4,
      rating: 16),
  Product(
      image:
          "https://images-na.ssl-images-amazon.com/images/I/510bN7jQYGL._SL1280_.jpg",
      title: "BLUEWEIGHT Solution for White Gut...",
      cost: 650,
      discount: 28,
      stars: 4,
      rating: 18),
  Product(
      image: "https://images-na.ssl-images-amazon.com/images/I/51XU8b2LSyL.jpg",
      title: "Maalavya Tetra Bits (Floaing/Sinking) Fish ...",
      cost: 475,
      discount: 24,
      stars: 4,
      rating: 56),
  Product(
      image:
          "https://images-na.ssl-images-amazon.com/images/I/71aXJwxdURS._SL1500_.jpg",
      title: "amiciTools 45W Submersible Water Pump...",
      cost: 648,
      discount: 28,
      stars: 4,
      rating: 897),
  Product(
      image:
          "https://images-na.ssl-images-amazon.com/images/I/61DnKrQoepL._SL1500_.jpg",
      title: "amiciTools 18 W Submersible Water Pump...",
      cost: 399,
      discount: 20,
      stars: 4,
      rating: 356),
];
