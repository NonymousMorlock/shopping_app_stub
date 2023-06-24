import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemedScaffold extends StatelessWidget {
  const ThemedScaffold({
    required this.bodyBuilder,
    super.key,
    this.appBar,
    this.appBarBuilder,
    this.backgroundColour,
    this.drawer,
    this.endDrawer,
  }) : assert(
          appBar == null || appBarBuilder == null,
          'You cannot provide both an appBar and an appBarBuilder',
        );

  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget Function(BuildContext context, ThemeState state) bodyBuilder;
  final PreferredSizeWidget Function(BuildContext context, ThemeState state)?
      appBarBuilder;
  final Color? backgroundColour;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundColour ?? state.backgroundColour,
          appBar: appBar ?? appBarBuilder?.call(context, state),
          body: bodyBuilder(context, state),
          drawer: drawer,
          endDrawer: endDrawer,
        );
      },
    );
  }
}
