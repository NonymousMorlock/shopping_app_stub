import 'package:badges/badges.dart';
import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              context.read<UserController>().user!.image,
            ),
            radius: 20,
          ),
        ),
      ),
      centerTitle: false,
      titleSpacing: 10,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning 👋',
            style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
          Text(
            context.read<UserController>().user!.name,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Notifications',
          onPressed: () {},
          icon: const Icon(IconlyLight.notification),
        ),
        Badge(
          badgeContent: Text(
            context.read<UserController>().user!.savedItemIds.length.toString(),
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          showBadge:
              context.read<UserController>().user!.savedItemIds.isNotEmpty,
          position: BadgePosition.topEnd(top: 2, end: 2),
          badgeStyle: BadgeStyle(
            padding: const EdgeInsets.all(4),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            tooltip: 'Saved Products',
            onPressed: () {},
            icon: const Icon(IconlyLight.heart),
          ),
        ),
        IconButton(
          tooltip: 'Menu',
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
