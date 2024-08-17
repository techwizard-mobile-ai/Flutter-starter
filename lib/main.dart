import "dart:ui";

import "package:flutter/material.dart";

class Product{
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChaged,
    super.key
  });

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChaged;

  Color _getColor(BuildContext context) => inCart? Colors.black54: Theme.of(context).primaryColor;

  TextStyle? _getTextStyle(BuildContext context){
    if(!inCart)
      return null;
    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      onTap: (){
        onCartChaged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style:_getTextStyle(context)
      ),
    );
  }
}

class ShoppingList extends StatefulWidget{
  const ShoppingList({
    required this.products,
    super.key
  });

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList>{
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart)
  {
    setState(() {
      if(!inCart)
        _shoppingCart.add(product);
      else _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("SHOPPING List"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product){
          return ShoppingListItem(product: product,
              inCart: _shoppingCart.contains(product),
              onCartChaged: _handleCartChanged );
        }).toList(),
      ),
    );
  }
}

void main()
{
  runApp(
    const MaterialApp(
      title: "Summary of This Section",
      home: ShoppingList(products: [
        Product(name: "Eggs"),
        Product(name: "SkyBox"),
        Product(name: "TeddyBear")
      ]),
    )
  );
}