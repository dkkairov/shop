import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/navigation/main_navigation.dart';
import 'package:shop/ui/widgets/home/product_group_list_model.dart';

class ProductGroupListScreen extends StatelessWidget {
  const ProductGroupListScreen({Key? key}) : super(key: key);

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
            _TitleWidget(),
            _CatalogueWidget(),
          ],
        )
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text('Каталог')
        )
    );
  }
}

class _CatalogueWidget extends StatelessWidget {
  const _CatalogueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductGroupListModel>();
    final groupList = _model.productGroupService.loadProductGroups();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 20.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final name = groupList[index].name;
          final quantity = groupList[index].quantity.toString();
          final image = groupList[index].image;
          return Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    clipBehavior: Clip.hardEdge,
                    child: image != '' ? Image.network(image) : Image.network(AppImages.emptyLogo),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Text(name)
                      ),
                      Text('$quantity шт.')
                    ],
                  )
                ],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => Navigator.pushNamed(context, MainNavigationRouteNames.productList),
                ),
              )
            ],
          );
        },
          childCount: groupList.length,
        ),
      ),
    );
  }
}