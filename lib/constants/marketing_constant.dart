class MarketingConstant {
  String url;
  String title;
  String seller;
  String address;
  int total;
  int price;
  int stars;
  int rating;
  MarketingConstant(
      {required this.title,
      required this.url,
      required this.seller,
      required this.address,
      required this.price,
      required this.rating,
      required this.stars,
      required this.total});
}

List<MarketingConstant> marketingData = [
  MarketingConstant(
    title: "Vanamei",
    url: "https://5.imimg.com/data5/GJ/RA/KW/SELLER-4285421/123-500x500.jpg",
    stars: 4,
    rating: 159,
    total: 150,
    price: 300,
    seller: "Ram",
    address: "Balasore, Odisha, India",
  ),
  MarketingConstant(
    title: "Black Tiger Shrimp",
    url:
        "https://5.imimg.com/data5/BF/ME/MJ/SELLER-102629287/black-tiger-shrimp-500x500.jpg",
    stars: 4,
    rating: 112,
    total: 50,
    price: 250,
    seller: "Shyam",
    address: "Balasore, Odisha, India",
  ),
  MarketingConstant(
    title: "Big White Prawns",
    url:
        "https://5.imimg.com/data5/ZH/BB/PW/ANDROID-90197121/images-3-jpeg-500x500.jpeg",
    stars: 4,
    rating: 47,
    total: 30,
    price: 100,
    seller: "Laxman",
    address: "Balasore, Odisha, India",
  ),
];
