import 'package:benaiah_okwukwe_anukem/core/res/media_res.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
            child: Lottie.asset(MediaRes.animatedLogo),
          ),
          // Home, Cart, Orders, Profile
          ListTile(
            leading: Icon(
               currentRoute == HomeScreen.routeName || currentRoute == '/'
                  ? IconlyBold.home
                  : IconlyLight.home,
            ),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(IconlyLight.buy),
            title: const Text('Cart'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(IconlyLight.bag_2),
            title: const Text('Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(IconlyLight.profile),
            title: const Text('Profile'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text('Logout'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
