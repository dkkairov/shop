import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/domain/entities/product.dart';
import 'package:shop/ui/providers/product_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop/ui/theme/app_theme_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final _model = context.watch<ProductModel>();
    final _cartIdList = _model.cartList.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish Swish'),
      ),
      body: const CustomScrollView(
        slivers: [
          _TotalInfoWidget(),
          _CatalogueWidget(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: ElevatedButton(
          onPressed: () => _model.addOrder(_cartIdList),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 50),
            primary: AppColors.mainBlue,
          ),
          child: Text(t?.pay ?? 'Pay'),
        ),
      ),
    );
  }
}

class _TotalInfoWidget extends StatelessWidget {
  const _TotalInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final _total = context.watch<ProductModel>().cartTotal.toString();
    return SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      t?.total ?? 'Total',
                      style: AppTextStyle.cartTotalSumTextStyle,
                    )),
                    Text(
                      '$_total ???',
                      style: AppTextStyle.cartTotalSumTextStyle,
                    )
                  ],
                )),
            const Divider(height: 2)
      ],
    ));
  }
}

class _CatalogueWidget extends StatelessWidget {
  const _CatalogueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.watch<ProductModel>();
    final _cartList = _model.cartList;
    // final List<Product> cartList = _model.productService
    //     .loadProducts()
    //     .where((element) => _cartList.contains(element.id))
    //     .toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final _theme = Provider.of<ThemeModel>(context, listen: false).currentTheme;
          final _name = _cartList[index].name;
          final _price = _cartList[index].price;
          final _priceString = _price.toString();
          final _rating = _cartList[index].rating.toString();
          final _image = _cartList[index].image;
          return Column(
            children: <Widget>[
              const SizedBox(height: 5),
              Card(
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
                            style: _theme != lightTheme
                                ? AppTextStyle.productCardNameDarkTextStyle
                                : AppTextStyle.productCardNameLightTextStyle,
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.star,
                                    size: 20, color: AppColors.mainGold),
                              ),
                              TextSpan(
                                text: ' $_rating',
                                style: _theme != lightTheme
                                    ? AppTextStyle.productCardRatingDarkTextStyle
                                    : AppTextStyle.productCardRatingLightTextStyle,
                              ),
                            ]),
                      ),
                      subtitle: Text(
                        '$_priceString ??',
                        style:  _theme != lightTheme
                            ? AppTextStyle.productCardPriceDarkTextStyle
                            : AppTextStyle.productCardPriceLightTextStyle,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: AppColors.mainBlue,
                        onPressed: () => _model.deleteFromCart(index, _price),
                      )),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Expanded(
                    child: SizedBox.shrink(),
                    flex: 1,
                  ),
                  Expanded(
                    child: Divider(height: 2),
                    flex: 4,
                  )
                ],
              )
            ],
          );
        },
        childCount: _cartList.length,
      ),
    );
  }
}
