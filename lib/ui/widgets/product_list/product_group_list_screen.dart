import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/resources/resources.dart';
import 'package:shop/ui/providers/product_provider.dart';
import 'package:shop/ui/theme/app_text_styles.dart';
import 'package:shop/ui/widgets/product_list/product_list_screen.dart';

class ProductGroupListScreen extends StatefulWidget {
  const ProductGroupListScreen({Key? key}) : super(key: key);

  @override
  State<ProductGroupListScreen> createState() => _ProductGroupListScreenState();
}

class _ProductGroupListScreenState extends State<ProductGroupListScreen> {
  String _title = 'Wish Swish';
  StreamSubscription? connection;
  bool isoffline = false;

  @override
  void initState() {
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isoffline = true;
          _title = 'Нет подключения к интернету';
        });
      } else {
        setState(() {
          isoffline = false;
          _title = 'Wish Swish';
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    connection!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductModel>();
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
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
        body: const CustomScrollView(
          slivers: [
            _TitleWidget(),
            _CatalogueWidget(),
          ],
        ));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Каталог',
              style: AppTextStyle.headerTextStyle,
            )));
  }
}

class _CatalogueWidget extends StatelessWidget {
  const _CatalogueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ProductModel>();
    final groupList = _model.productGroupService.loadProductGroups();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 20.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final name = groupList[index].name;
            final quantity = groupList[index].quantity.toString();
            final image = groupList[index].image;
            return Stack(
              children: [
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 12.0 / 9.0,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        clipBehavior: Clip.hardEdge,
                        child: image != ''
                            ? Image.network(image)
                            : Image.network(AppImages.emptyLogo),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: Text(name)),
                        Text('$quantity шт.')
                      ],
                    )
                  ],
                ),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => Navigator.pushNamed(
                        context,
                        ProductListScreen.routeName,
                        arguments: ScreenArguments(index),
                      ),
                    ))
              ],
            );
          },
          childCount: groupList.length,
        ),
      ),
    );
  }
}
