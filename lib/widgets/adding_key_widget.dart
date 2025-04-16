import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/views/auth/login/forgot_password_view.dart';

class AddingKeyWidget extends StatefulWidget {
  const AddingKeyWidget({
    super.key,
  });

  @override
  State<AddingKeyWidget> createState() => _AddingKeyWidgetState();
}

class _AddingKeyWidgetState extends State<AddingKeyWidget> {
  TextEditingController keyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Add Key',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: keyController,
                decoration: const InputDecoration(
                  hintText: 'key',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              GetBuilder<LoginController>(
                builder: (controller) => ElevatedButton(
                  onPressed: () {
                    controller.changeLoading();
                    CachedHelper.saveData(
                        key: 'url', value: keyController.text);
                    //DioHelper.key = keyController.text;
                    Future.delayed(const Duration(seconds: 2)).then((value) {
                      controller.changeLoading();
                      Get.back();
                    });
                  },
                  child: controller.isLoading
                      ? const LoadingWidget()
                      : Text(
                          'Add',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
