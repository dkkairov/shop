import 'package:shop/domain/entities/product_group.dart';

class ProductGroupDataProvider {

  final List<ProductGroup> _groupList = [
    ProductGroup('Овощи', 80, 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg'),
    ProductGroup('Фрукты', 120, 'https://cdn-user30887.skyeng.ru/uploads/5f42be1ca1dfb384564528.jpg'),
    ProductGroup('Бакалея', 50, 'https://witt-international.scene7.com/is/image/OttoUK/600w/Laithwaites-6-Big-Bottles-of-Red-Wine~56G641FRSP.jpg'),
    ProductGroup('Молочка', 170, 'https://laktonmilk.ru/upload/iblock/267/26705aebc5429b0c64f7a15bdfff5b5c.png'),
    ProductGroup('Овощи', 80, 'https://n1s2.hsmedia.ru/d8/80/0b/d8800b6c922a52b207406234fed9aa0c/728x546_1_79158a87cfdffec9fa310109ca17431a@1708x1281_0xac120003_3571839591619686538.jpg'),
    ProductGroup('Фрукты', 120, 'https://cdn-user30887.skyeng.ru/uploads/5f42be1ca1dfb384564528.jpg'),
    ProductGroup('Бакалея', 50, 'https://witt-international.scene7.com/is/image/OttoUK/600w/Laithwaites-6-Big-Bottles-of-Red-Wine~56G641FRSP.jpg'),
    ProductGroup('Молочка', 170, 'https://laktonmilk.ru/upload/iblock/267/26705aebc5429b0c64f7a15bdfff5b5c.png'),
  ];

  List<ProductGroup> loadProductGroups()  {
    return _groupList;
  }

}
