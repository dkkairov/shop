import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/ui/widgets/home/home_screen.dart';
import 'package:shop/ui/widgets/home/product_group_list_model.dart';
import 'package:shop/ui/widgets/product_list/product_list_model.dart';
import 'package:shop/domain/entities/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductGroupListModel>();
    final _groupModel = context.watch<ProductGroupListModel>();
    final _cartIdList = _groupModel.cartIdList.toList();
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
          _TotalInfoWidget(),
          _CatalogueWidget(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: ElevatedButton(
          onPressed: () => _groupModel.addOrder(_cartIdList),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(100, 50),
            primary: AppColors.mainBlue,
          ),
          child: const Text('Оплатить'),
        ),
      ),
    );
  }
}

class _TotalInfoWidget extends StatelessWidget {
  const _TotalInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Expanded(child: Text('Итого')),
                Text('1500 р')
              ],
            )
          ),
          Divider(height: 2)
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
    final _groupModel = context.watch<ProductGroupListModel>();
    final _cartIdList = _groupModel.cartIdList.toList();
    final List<Product> cartList = _model.productService.loadProducts().where((element) => _cartIdList.contains(element.id)).toList();
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final _name = cartList[index].name;
          final _price = cartList[index].price.toString();
          final _rating = cartList[index].rating.toString();
          final _image = cartList[index].image;
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
                        icon: const Icon(Icons.delete),
                        color: AppColors.mainBlue,
                        onPressed: () => _groupModel.deleteFromCart(index),
                      )
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Expanded(child: SizedBox.shrink(), flex: 1,),
                  Expanded(child: Divider(height: 2), flex: 4,)
                ],
              )
            ],
          );
        },
          childCount: cartList.length,
        ),
    );
  }
}