import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/navigation/main_navigation.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/domain/entities/product.dart';
import 'package:shop/ui/providers/product_provider.dart';

class ProductListScreen extends StatelessWidget {
  final int groupIndex;
  const ProductListScreen({Key? key, required this.groupIndex})
      : super(key: key);

  static const routeName = MainNavigationRouteNames.productList;

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductModel>();
    final _groupModel = context.read<ProductModel>();
    final List<Product> productListInGroup = _model.productService
        .loadProducts()
        .where((element) => element.productGroup == groupIndex)
        .toList();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.format_paint),
              onPressed: () {
                Provider.of<ThemeModel>(context, listen: false).toggleTheme();
              },
            ),
            IconButton(
              onPressed: () => _model.onLogoutPressed(context),
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final _productId = productListInGroup[index].id;
                  final _name = productListInGroup[index].name;
                  final _price = productListInGroup[index].price;
                  final _priceString = _price.toString();
                  final _rating = productListInGroup[index].rating.toString();
                  final _image = productListInGroup[index].image;
                  return Card(
                    shape: const RoundedRectangleBorder(),
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 90,
                      child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            clipBehavior: Clip.hardEdge,
                            child: _image != ''
                                ? Image.network(_image)
                                : Image.network(AppImages.emptyLogo),
                          ),
                          title: RichText(
                            text: TextSpan(
                                text: '$_name   ',
                                style: AppTextStyle.productCardNameTextStyle,
                                children: [
                                  const WidgetSpan(
                                    child: Icon(Icons.star,
                                        size: 20, color: AppColors.mainGold),
                                  ),
                                  TextSpan(
                                    text: ' $_rating',
                                    style:
                                        AppTextStyle.productCardRatingTextStyle,
                                  ),
                                ]),
                          ),
                          subtitle: Text(
                            '$_priceString р',
                            style: AppTextStyle.productCardPriceTextStyle,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            color: AppColors.mainBlue,
                            onPressed: () =>
                                _groupModel.addToCart(_productId, _price),
                          )),
                    ),
                  );
                },
                childCount: productListInGroup.length,
              ),
            ),
          ],
        ));
  }
}

class ScreenArguments {
  final int groupIndex;

  ScreenArguments(this.groupIndex);
}
