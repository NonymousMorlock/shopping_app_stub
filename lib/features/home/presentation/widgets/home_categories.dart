import 'package:benaiah_okwukwe_anukem/core/extensions/context_extensions.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/string_extensions.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/app/providers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsController>(
      builder: (_, controller, __) {
        return Container(
          height: context.height * 0.05,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            controller: ScrollController(),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: controller.categories.map((category) {
              return GestureDetector(
                onTap: () => controller.selectCategory(category),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: controller.selectedCategory == category
                          ? context.theme.primaryColorLight
                          : Colors.grey[200]!,
                    ),
                  ),
                  margin: controller.categories.last == category
                      ? null
                      : const EdgeInsets.only(right: 5),
                  child: Chip(
                    backgroundColor: controller.selectedCategory == category
                        ? context.theme.primaryColorLight
                        : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    label: Text(category.titleCase),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
