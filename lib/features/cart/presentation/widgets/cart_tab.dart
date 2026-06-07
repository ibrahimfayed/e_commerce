import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_card.dart';
import 'package:e_commerce/features/cart/presentation/widgets/empty_cart.dart';
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final int itemcount = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      children: [
        Text('Cart', style: getBoldStyle(color: ColorManager.black)),
        Container(
          color: ColorManager.border,
          width: .infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
              'You have 3 products in your cart',
              style: getRegularStyle(color: ColorManager.green),
            ),
          ),
        ),
        Expanded(
          child: (itemcount == 0)
              ? EmptyCart()
              : ListView.separated(
                  itemBuilder: (_, index) => CartCard(),
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemCount: itemcount,
                ),
        ),
        CustomElevatedButton(
          label: 'Checkout 260.00 EGP',
          onTap: () {},
          isStadiumBorder: false,
          outerPadding: const EdgeInsets.all(16),
          backgroundColor: (itemcount == 0) ? null : ColorManager.primaryColor,
        ),
      ],
    );
  }
}
