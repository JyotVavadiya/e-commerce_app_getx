import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList favorite = [].obs;
  RxList cart = [].obs;

  RxInt totalProducts = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  favoriteAdd({required ProductModel data}) {
    if (!favorite.contains(data)) {
      favorite.add(data);
    }
  }

  favoriteRemove({required ProductModel data}) {
    favorite.remove(data);
  }

  addCart({required ProductModel product}) {
    product.quantity.value = product.quantity.value + 1;
    if (!cart.contains(product)) {
      cart.add(product);
    } else {
      totalProducts.value++;
      totalPrice.value += product.price;
    }
  }

  incrementQuantity({required ProductModel product}) {
    product.quantity++;
    totalProducts.value++;
    totalPrice.value += product.price;
  }

  decrementQuantity({required ProductModel product}) {
    if (product.quantity > 1) {
      product.quantity--;
      totalProducts.value--;
      totalPrice.value -= product.price;
    } else if (product.quantity == 1) {
      product.quantity--;
      cart.remove(product);
    } else {
      cart.remove(product);
    }
  }

  get getTotalProductsLength {
    return cart.length + totalProducts.value;
  }

  get getTotalPrice{
    double price = 0;
    cart.forEach((element) {
      price += element.price;
    });

    return price + totalPrice.value;
  }
}
