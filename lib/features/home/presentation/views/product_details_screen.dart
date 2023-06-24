import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/bloc_scaffold.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/expandable_text.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/rounded_button.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/context_extensions.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/double_extensions.dart';
import 'package:benaiah_okwukwe_anukem/features/home/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(this.product, {super.key});

  static const routeName = '/product-details';

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _currentImageIndex = 0;

  ValueNotifier<int> quantityNotifier = ValueNotifier(1);

  ValueNotifier<Color?> selectedColor = ValueNotifier(null);

  void incrementQuantity() {
    quantityNotifier.value++;
  }

  void pickColor(Color color) {
    selectedColor.value = color;
  }

  void decrementQuantity() {
    if (quantityNotifier.value > 1) {
      quantityNotifier.value--;
    }
  }

  void _onImageChange(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold(
      bodyBuilder: (context, state) {
        return SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: context.height * 0.4,
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        shape: BoxShape.circle,
                      ),
                      child: Theme.of(context).platform == TargetPlatform.iOS
                          ? const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )
                          : const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: CarouselSlider(
                    items: widget.product.images.map((image) {
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: context.height * 0.4,
                      viewportFraction: 1,
                      autoPlay: true,
                      onPageChanged: _onImageChange,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.easeInOut,
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: DotsIndicator(
                      dotsCount: widget.product.images.length,
                      position: _currentImageIndex,
                      decorator: DotsDecorator(
                        activeColor: Colors.white,
                        size: const Size.square(5),
                        activeSize: const Size(18, 5),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                  fontSize: 24,
                                ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              context
                                      .read<UserController>()
                                      .user!
                                      .savedItemIds
                                      .contains(widget.product.id)
                                  ? IconlyBold.heart
                                  : IconlyLight.heart,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey.shade200),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ExpandableText(widget.product.description),
                          const SizedBox(height: 10),
                          Text(
                            'Color',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          MediaQuery.removePadding(
                            removeRight: true,
                            removeLeft: true,
                            context: context,
                            child: ValueListenableBuilder(
                              valueListenable: selectedColor,
                              builder: (_, value, __) {
                                return SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount:
                                        widget.product.availableColors.length,
                                    itemBuilder: (context, index) {
                                      final color =
                                          widget.product.availableColors[index];
                                      return GestureDetector(
                                        onTap: () => pickColor(color),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: color,
                                            shape: BoxShape.circle,
                                          ),
                                          child: value == color
                                              ? Icon(
                                                  Icons.check,
                                                  color: color == Colors.white
                                                      ? Colors.black
                                                      : Colors.white,
                                                )
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Quantity',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (quantityNotifier.value > 1) {
                                            quantityNotifier.value--;
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade300,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      ValueListenableBuilder(
                                        valueListenable: quantityNotifier,
                                        builder: (context, value, _) {
                                          return Text(
                                            '$value',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          quantityNotifier.value++;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade300,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey.shade200),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: quantityNotifier,
                                builder: (context, value, _) {
                                  final price = widget.product.price * value;
                                  return Text(
                                    '\$${price.decimalFormat}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.1,
                                          fontSize: 24,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[350]!,
                                  blurRadius: 8,
                                  offset: const Offset(5, 10),
                                ),
                              ],
                            ),
                            child: RoundedButton(
                              buttonText: 'Add to cart',
                              icon: IconlyBold.lock,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
