import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';

class FloatingActionButtonLoginTablet extends StatefulWidget {
  const FloatingActionButtonLoginTablet({super.key});

  @override
  State<FloatingActionButtonLoginTablet> createState() =>
      _FloatingActionButtonLoginTabletState();
}

class _FloatingActionButtonLoginTabletState
    extends State<FloatingActionButtonLoginTablet> {
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black54,
      onPressed: () => _controller.onPressedFloatingTabletButton(),
      child: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
