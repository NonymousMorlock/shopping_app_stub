import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/core/common/widgets/bloc_scaffold.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/context_extensions.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/widgets/home_app_bar.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/widgets/home_body.dart';
import 'package:benaiah_okwukwe_anukem/features/home/presentation/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold(
      appBar: const HomeAppBar(),
      bodyBuilder: (context, state) {
        return const HomeBody();
      },
      endDrawer: const HomeDrawer(),
    );
  }
}
