import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domain/entities/theme.dart';
import 'package:shop/ui/widgets/home/home_screen.dart';
import 'package:shop/ui/widgets/app/my_app.dart';
import 'package:shop/ui/providers/product_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => ScreenIndexModel()),
        ChangeNotifierProvider(create: (_) => ProductModel()),
      ],
        child: const MyApp(),
    )
  );
}