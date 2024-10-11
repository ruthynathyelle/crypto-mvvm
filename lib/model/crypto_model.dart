class CryptoModel {
  String cryptoName;
  double price;
  String symbol;
  String image;
  double marketcap;
  double volume;
  double circulating;



  CryptoModel({required this.cryptoName, required this.price, required this.symbol, required this.image, required this.marketcap, 
  required this.volume, required this.circulating});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        cryptoName: json['name'],
        price: json['current_price'].toDouble(),
        symbol: json['symbol'],
        image: json['image'],
        marketcap: json['market_cap'].toDouble(),
        volume: json['total_volume'].toDouble(),
        circulating: json['circulating_supply'].toDouble());
  }
}
