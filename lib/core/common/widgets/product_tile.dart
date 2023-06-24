import 'package:badges/badges.dart';
import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/features/home/models/product.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/views/product_details_screen.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isSaved =
        context.read<UserController>().user!.savedItemIds.contains(product.id);
    return Badge(
      position: BadgePosition.topEnd(),
      badgeStyle: const BadgeStyle(
        badgeColor: Colors.transparent,
      ),
      onTap: () {
        // TODO(SAVE-PRODUCT): Save product to favourites
        final user = context.read<UserController>().user!;
      },
      badgeContent: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isSaved ? IconlyBold.heart : IconlyLight.heart,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductDetailsScreen.routeName,
            arguments: product,
          );
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(product.images.first),
                      // TODO(IMAGE-FIT): Change image fit to appropriate value
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
