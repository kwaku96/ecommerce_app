class ShopItem{
  String name;
  String imageURL;
  double rating;
  double price;

  ShopItem({
    this.imageURL,
    this.name,
    this.price,
    this.rating
  });
}

List<ShopItem> shopItems = [
  new ShopItem(
    name: 'Peach',
    price: 12.0,
    rating: 0.0,
    imageURL: 'https://bit.ly/2Bskafu'
  ),
  new ShopItem(
    imageURL: 'http://bit.do/eHWzJ',
    name: 'Grapes',
    price: 20.0,
    rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWzZ',
      name: 'Oranges',
      price: 2.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWAj',
      name: 'Melons',
      price: 10.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWAu',
      name: 'Mangoes',
      price: 40.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWAB',
      name: 'Banana',
      price: 25.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWAY',
      name: 'Carbage',
      price: 20.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWA7',
      name: 'Spinach',
      price: 8.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWBn',
      name: 'Carrots',
      price: 3.0,
      rating: 0.0
  ),
  new ShopItem(
      imageURL: 'http://bit.do/eHWBL',
      name: 'Tomatoes',
      price: 4.0,
      rating: 0.0
  )
];