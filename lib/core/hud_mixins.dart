import 'package:flutter/material.dart';

mixin HudMixins {
  showSnack(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  
}
