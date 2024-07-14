import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/notifiers/notifier.dart';
import 'package:riverpod_flutter/screens/cart.dart';

class Iconbutton extends ConsumerWidget {
  const Iconbutton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the cart item count
    final cartItemCount = ref.watch(cartNotifierProvider).length;

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
        ),
        if (cartItemCount > 0)
          Positioned(
            right: 32,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                '$cartItemCount',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
