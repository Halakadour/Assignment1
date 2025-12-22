import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/widgets/layouts/templates/custom_site_template.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSiteTemplate(
        currentPageIndex: widget.shell.currentIndex,
        onItemSelected: (index) {
          widget.shell.goBranch(index);
        },
        desktop: widget.shell,
      ),
    );
  }
}
