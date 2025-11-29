import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'keranjang.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Consumer<Keranjang>(
        builder: (context, keranjang, child) {
          if (keranjang.item.isEmpty) {
            return const Center(child: Text("Data kosong"));
          }

          return ListView.builder(
            itemCount: keranjang.item.length,
            itemBuilder: (context, index) {
              var data = keranjang.item[index];
              return Card(
                child: ListTile(
                  title: Text(data.nama),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      keranjang.remove(data);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}