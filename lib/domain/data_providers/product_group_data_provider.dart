import 'package:shop/domain/entities/product_group.dart';

class ProductGroupDataProvider {

  final List<ProductGroup> _groupList = [
    ProductGroup('Овощи', 80, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Молочка', 120, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Бакалея', 50, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Снэки', 170, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Овощи', 80, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Молочка', 120, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Бакалея', 50, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
    ProductGroup('Снэки', 170, 'http://ftp.funet.fi/pub/TeX/CTAN/macros/latex/contrib/mwe/example-image-1x1.jpg'),
  ];

  List<ProductGroup> loadProductGroups()  {
    return _groupList;
  }

}
