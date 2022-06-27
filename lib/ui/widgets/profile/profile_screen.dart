import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/product.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/ui/providers/product_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _ProfileInfoWidget(),
          _OrdersListWidget(),
        ],
      ),
    );
  }
}

class _ProfileInfoWidget extends StatelessWidget {
  const _ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = context.read<ProductModel>().user;
    final _firstName = _user.firstName;
    final _lastName = _user.lastName;
    final _avatar = _user.image;
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.mainLightGrey,
                    child: CircleAvatar(
                        radius: 47,
                        backgroundColor: AppColors.mainWhite,
                        backgroundImage: _avatar != ''
                            ? NetworkImage(_avatar)
                            : const NetworkImage(AppImages.emptyLogo)
                    ),
                  ),
                  const SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(_firstName,
                      style: AppTextStyle.profileNameTextStyle,
                      ),
                      Text(_lastName,
                        style: AppTextStyle.profileNameTextStyle,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text('История покупок',
                    style: AppTextStyle.historyTextStyle,
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}


class _OrdersListWidget extends StatelessWidget {
  const _OrdersListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _groupModel = context.watch<ProductModel>();
    final _ordersList = _groupModel.ordersList.toList();
    return SliverToBoxAdapter(
      child: Column(
        children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _ordersList.length,
          itemBuilder: (BuildContext context, int index) {
            final _orderNumber = index + 1;
            final _orderSum = _groupModel.sumOrderTotal(_ordersList, index).toString();
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.mainLightGrey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.mainWhite,
                  width: 0.5
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Text(
                            'Заказ № $_orderNumber',
                          style: AppTextStyle.boldTextStyle,
                        )),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.mainGrey),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(5.0)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              child: Center(child: Text(
                                '$_orderSum ₽',
                                style: AppTextStyle.profileTotalSumTextStyle,
                              )),
                              width: 50,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: _ordersList[index].length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        final _model = context.read<ProductModel>();
                        final List<Product> _productList = _model.productService
                            .loadProducts().where((element) => _ordersList[index]
                            .contains(element.id)).toList();
                        final _name = _productList[itemIndex].name;
                        final _price = _productList[itemIndex].price.toString();
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(_name)
                              ),
                              Text('$_price ₽'),
                            ],
                          ),
                        );
                      }
                  ),
                ],
              ),
            );
          }
        )
        ],
      ),
    );
  }
}