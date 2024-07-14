import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_flutter/models/model.dart';

part 'notifier.g.dart';
@riverpod
class CartNotifier extends _$CartNotifier {
 
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toSet();
  }
}

@riverpod
int cartTotal(ref){
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;
  for(Product product in cartProducts){
    total += product.price;
  }

  return total;
}