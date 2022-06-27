import 'package:shop/domain/entities/product.dart';

class ProductDataProvider {
  final List<Product> _productList = [
    Product(id: 0, name: 'Товар 1', price: 10, rating: 4.1, image: 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg', productGroup: 1),
    Product(id: 1, name: 'Товар 2', price: 20, rating: 4.2, image: 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg', productGroup: 1),
    Product(id: 2, name: 'Товар 3', price: 30, rating: 4.3, image: 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg', productGroup: 1),
    Product(id: 3, name: 'Товар 4', price: 40, rating: 4.4, image: 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg', productGroup: 1),
    Product(id: 4, name: 'Товар 5', price: 40, rating: 3.4, image: 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg', productGroup: 1),
    Product(id: 5, name: 'Товар 6', price: 40, rating: 3.4, image: 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg', productGroup: 1),
  ];

  List<Product> loadProducts()  {
    return _productList;
  }

  Product getProduct(index) {
    return _productList.elementAt(index);
  }
}
