import 'package:flutter/material.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/product.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/ui/widgets/home/product_group_list_model.dart';
import 'package:shop/ui/widgets/product_list/product_list_model.dart';
import 'package:shop/ui/widgets/profile/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Widget create() {
    return Provider(
      create: (context) => ProfileModel(),
      child: const ProfileScreen(),
      lazy: false,
    );
  }

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
    final _user = context.read<ProfileModel>().user;
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
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(_firstName),
                      Text(_lastName),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: const [
                  Text('История покупок')
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
    final _groupModel = context.watch<ProductGroupListModel>();
    final _ordersList = _groupModel.ordersList.toList();
    return SliverToBoxAdapter(
      child: Column(
        children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _ordersList.length,
          itemBuilder: (BuildContext context, int index) {
            final _orderNumber = index;
            final _orderSum = _groupModel.sumOrderTotal(_ordersList, index).toString();
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: AppColors.mainLightGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Text(
                            'Заказ №$_orderNumber',
                          style: AppTextStyle.orderNameTextStyle,
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
                                style: AppTextStyle.totalSumTextStyle,
                              )),
                              width: 45,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: _ordersList[index].length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        final _model = context.read<ProductListModel>();
                        final List<Product> _productList = _model.productService
                            .loadProducts().where((element) => _ordersList[index]
                            .contains(element.id)).toList();
                        final _name = _productList[itemIndex].name;
                        final _price = _productList[itemIndex].price.toString();
                        return Row(
                          children: [
                            Text(_name),
                            Text(_price),
                          ],
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