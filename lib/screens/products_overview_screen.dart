import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  const ProductOverViewScreen({super.key});

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.Favorites) {
                setState(() {
                  _showFavoritesOnly = true;
                });
              } else {
                setState(() {
                  _showFavoritesOnly = false;
                });
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return [
                const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('Only Favorites')),
                const PopupMenuItem(
                    value: FilterOptions.All, child: Text('Show All')),
              ];
            },
          ),
          Consumer<Cart>(
            builder: ((_, cartData, ch) => Badge(
                  value: cartData.itemCount.toString(),
                  child: ch!,
                )),
            child: IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductsGrid(showFavs: _showFavoritesOnly),
    );
  }
}
