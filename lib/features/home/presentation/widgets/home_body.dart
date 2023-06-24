import 'package:benaiah_okwukwe_anukem/core/common/widgets/product_tile.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/app/providers/products_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsController>(
      builder: (_, controller, __) {
        return ListView(
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          children: [
            const HomeCategories(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return ProductTile(product: product);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
