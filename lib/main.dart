import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/ui/widgets/home/product_group_list_model.dart';
import 'package:shop/ui/widgets/home/home_screen.dart';
import 'package:shop/ui/widgets/app/my_app.dart';
import 'package:shop/ui/widgets/product_list/product_list_model.dart';
import 'package:shop/ui/widgets/profile/profile_model.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => ScreenIndexModel()),
        ChangeNotifierProvider(create: (_) => ProductGroupListModel()),
        ChangeNotifierProvider(create: (_) => ProductListModel()),
        ChangeNotifierProvider(create: (_) => ProfileModel()),
      ],
        child: const MyApp(),
    )
  );
}