class Item {
  final String name;
  final double price;
  const Item({required this.name, required this.price});
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(name: json['name'], price: json['price']);
  }
}

class Store {
  final String name;
  final String location;
  final String id;
  const Store({required this.name, required this.location, required this.id});
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
        name: json['name'], location: json['location'], id: json['_id']);
  }
}

class Receipt {
  final List<Item> items;
  final Store store;
  // final int creationDate;
  const Receipt({required this.items, required this.store});
  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e))
          .toList(),
      store: Store.fromJson(json['store']),
    );
  }
}
