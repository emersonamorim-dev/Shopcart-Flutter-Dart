import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          hintColor: Colors.orange,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
          ),
        ),
        home: ProductsOverviewScreen(),
      ),
    );
  }
}

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(id: 'p1', name: 'Produto 1', price: 29.99),
    Product(id: 'p2', name: 'Produto 2', price: 49.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen())),
            child: Text('Carrinho'),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(loadedProducts[i].name),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addItem(loadedProducts[i]);
            },
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Seu Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(cartItems[i].name),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.secondary,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Text(
              'Total: R\$${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreditCardPaymentScreen(amount: cart.totalAmount)));
            },
            child: Text('Pagar com Cartão de Crédito'),
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class CreditCardPaymentScreen extends StatelessWidget {
  final double amount;

  CreditCardPaymentScreen({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento com Cartão de Crédito'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Número do Cartão'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Data de Validade (MM/YY)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'CVC'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Pagar R\$${amount.toStringAsFixed(2)}'),
            ),
          ],
        ),
      ),
    );
  }
}
