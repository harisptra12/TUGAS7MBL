import 'package:flutter/material.dart';
import 'package:tugas7hari/model/product.dart';
import 'package:provider/provider.dart';
import 'keranjang.dart';
import 'halaman_keranjang.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Keranjang(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sylph.Art",
      home: const HalamanBelanja(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanBelanja extends StatelessWidget {
  const HalamanBelanja({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product("frame"),
      Product("kechain"),
      Product("frame 3d"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Belanja"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        actions: [
          Consumer<Keranjang>(
            builder: (context, keranjang, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_checkout),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HalamanKeranjang(),
                        ),
                      );
                    },
                  ),
                  if (keranjang.n > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          keranjang.n.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.nama),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Provider.of<Keranjang>(context, listen: false).add(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}