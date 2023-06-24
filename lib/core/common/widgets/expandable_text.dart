import 'package:benaiah_okwukwe_anukem/core/common/widgets/small_text.dart';
import 'package:benaiah_okwukwe_anukem/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(this.text, {super.key});

  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  double get textHeight => context.height / 5.63;

  /// 5% of screen height

  void setText() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
        textHeight.toInt() + 1,
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              fontSize: 16,
              height: 1.8,
              colour: const Color(0xFF8f837f),
            )
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  text:
                      hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
                  fontSize: 16,
                  colour: const Color(0xFF8f837f),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show ${hiddenText ? "more" : "less"}",
                        colour: Theme.of(context).primaryColor,
                        height: 1.2,
                        fontSize: 12,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
