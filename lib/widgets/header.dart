import 'package:citizenwallet/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? subTitleWidget;
  final Widget? actionButton;
  final bool manualBack;
  final bool transparent;

  const Header({
    super.key,
    required this.title,
    this.subTitleWidget,
    this.subTitle,
    this.actionButton,
    this.manualBack = false,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return Container(
      decoration: BoxDecoration(
        color: transparent
            ? ThemeColors.transparent.resolveFrom(context)
            : ThemeColors.uiBackground.resolveFrom(context),
        border: Border(
          bottom: BorderSide(color: ThemeColors.border.resolveFrom(context)),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (router.canPop() && !manualBack)
                GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          CupertinoIcons.back,
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
                width: 60.0,
                child: Center(
                  child: actionButton,
                ),
              ),
            ],
          ),
          if (subTitleWidget != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                child: subTitleWidget,
              ),
            ),
          if (subTitle != null && subTitle!.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                child: Text(
                  subTitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
