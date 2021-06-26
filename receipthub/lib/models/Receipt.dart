class Item {
  final String name;
  final double price;
  const Item(this.name, this.price);
}

class Store {
  final String name;
  final String location;
  final String id;
  const Store(this.name, this.location, this.id);
}

class Receipt {
  final List<Item> items;
  final Store store;
  final int creationDate;
  const Receipt(this.items, this.store, this.creationDate);
}
