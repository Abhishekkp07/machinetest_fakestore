import 'package:flutter/material.dart';
import 'package:machinetest_fakestore/presentation/cart/controller/cart_controller.dart';
import 'package:machinetest_fakestore/presentation/homescreen/homescreen_controller/controller.dart';
import 'package:machinetest_fakestore/presentation/homescreen/view/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(FakeStoreApp());
}

class FakeStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
