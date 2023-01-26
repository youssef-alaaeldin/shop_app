import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'prducts_item.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFavs;
  const ProductsGrid({
    Key? key, required this.showFavs,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    
   final productsData =  Provider.of<Products>(context);
    final loadedProducts = showFavs ? productsData.favoriteItems :productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: const ProductItem(),
            // id: loadedProducts[index].id,
            // title: loadedProducts[index].title,
            // imageUrl: loadedProducts[index].imageUrl),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
