import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/ui/widgets/home/product_group_list_model.dart';
import 'package:shop/ui/widgets/product_list/product_list_model.dart';
import 'package:shop/domain/entities/product.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductGroupListModel>();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton (
              icon: const Icon(Icons.format_paint),
              onPressed: (){
                Provider.of<ThemeModel>(context, listen: false).toggleTheme();
              },
            ),
            IconButton(
              onPressed: () => _model.onLogoutPressed(context),
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: const CustomScrollView(
          slivers: [
            _CatalogueWidget(),
          ],
        )
    );
  }
}

class _CatalogueWidget extends StatelessWidget {
  const _CatalogueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductListModel>();
    final _groupModel = context.read<ProductGroupListModel>();
    final List<Product> productListInGroup = _model.productService.loadProducts().where((element) => element.productGroup == 1).toList();
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final _name = productListInGroup[index].name;
          final _price = productListInGroup[index].price.toString();
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
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  clipBehavior: Clip.hardEdge,
                  child: _image != '' ? Image.network(_image) : Image.network(AppImages.emptyLogo),
                ),
                title: RichText(
                  text: TextSpan(
                      text: '$_name   ',
                      style: AppTextStyle.productCardNameTextStyle,
                      children: [
                        const WidgetSpan(
                          child: Icon(Icons.star, size: 20, color: AppColors.mainGold),
                        ),
                        TextSpan(text: ' $_rating',
                            style: AppTextStyle.productCardRatingTextStyle,
                        ),
                      ]
                  ),
                ),
                subtitle: Text(
                  '$_price р',
                  style: AppTextStyle.productCardPriceTextStyle,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: AppColors.mainBlue,
                  onPressed: () => _groupModel.addToCart(index),
                )
              ),
            ),
          );
        },
          childCount: productListInGroup.length,
        ),
    );
  }
}