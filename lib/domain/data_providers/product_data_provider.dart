import 'package:shop/domain/entities/product.dart';

class ProductDataProvider {
  final List<Product> _productList = [
    Product(id: 0, name: 'Товар 1', price: 10, rating: 4.1, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 0),
    Product(id: 1, name: 'Товар 2', price: 20, rating: 4.2, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 0),
    Product(id: 2, name: 'Товар 3', price: 30, rating: 4.3, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 0),
    Product(id: 3, name: 'Товар 4', price: 40, rating: 4.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 0),
    Product(id: 4, name: 'Товар 5', price: 40, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 1),
    Product(id: 5, name: 'Товар 6', price: 40, rating: 2.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 1),
    Product(id: 6, name: 'Товар 7', price: 30, rating: 4.3, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 1),
    Product(id: 7, name: 'Товар 8', price: 40, rating: 4.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 2),
    Product(id: 8, name: 'Товар 9', price: 50, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 2),
    Product(id: 9, name: 'Товар 10', price: 100, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 3),
    Product(id: 10, name: 'Товар 11', price: 40, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 3),
    Product(id: 11, name: 'Товар 12', price: 80, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 4),
    Product(id: 12, name: 'Товар 13', price: 30, rating: 4.3, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 5),
    Product(id: 13, name: 'Товар 14', price: 40, rating: 4.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 6),
    Product(id: 15, name: 'Товар 15', price: 90, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 7),
    Product(id: 15, name: 'Товар 16', price: 40, rating: 3.4, image: 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg', productGroup: 8),
  ];

  List<Product> loadProducts()  {
    return _productList;
  }

  Product getProduct(index) {
    return _productList.elementAt(index);
  }
}
