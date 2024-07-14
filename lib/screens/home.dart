import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/IconButton/iconbtn.dart';
import 'package:riverpod_flutter/models/provider.dart';
import 'package:riverpod_flutter/notifiers/notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProduct = ref.watch(homeproductProviderProvider);
    final cartProduct = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          const Iconbutton(),
        ],
        title: Text(
          "Product Sale",
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: GridView.builder(
            itemCount: homeProduct.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Image.asset(
                      homeProduct[index].image,
                      height: 60,
                      width: 60,
                    ),
                    Text(homeProduct[index].title),
                    Text("${homeProduct[index].price}"),
                    if (cartProduct.contains(homeProduct[index]))
                      TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .removeProduct(homeProduct[index]);
                          },
                          child: Text("Remove",style: TextStyle( 
                             fontSize: 16,
                          ),)),
                    if (!cartProduct.contains(homeProduct[index]))
                      TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProduct(homeProduct[index]);
                          },
                          child: Text("Add to cart",style: TextStyle( 
                             fontSize: 16,
                          )))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
