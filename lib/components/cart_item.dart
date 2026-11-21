import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';

class CartItem extends StatelessWidget {
  final Shoe shoe;

  const CartItem({
    super.key,
    required this.shoe,
  });

  // Remove item from cart
  void removeItemFromCart(BuildContext context) {
    Provider.of<Cart>(
      context,
      listen: false,
    ).removeItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.all(10),

        // Shoe image
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            shoe.imagepath,
            width: 65,
            height: 65,
            fit: BoxFit.contain,
          ),
        ),

        // Shoe name
        title: Text(
          shoe.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        // Shoe price
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '\$${shoe.price}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15,
            ),
          ),
        ),

        // Delete button
        trailing: IconButton(
          onPressed: () => removeItemFromCart(context),
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}