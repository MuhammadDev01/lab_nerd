import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/login_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text_form_field.dart';

class SignupDesktopFields extends StatefulWidget {
  const SignupDesktopFields({super.key});

  @override
  State<SignupDesktopFields> createState() => _SignupDesktopFieldsState();
}

class _SignupDesktopFieldsState extends State<SignupDesktopFields> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              'SIGNUP',
              style: TextStyles.rem14Bold.copyWith(fontSize: 24),
            ),
            DefaultTextFormField(
              helperText: 'Username',
              width: 650,
              hintText: 'username',
              controller: usernameController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 4,
            ),
            GetBuilder<LoginController>(
              builder: (controller) => DefaultTextFormField(
                helperText: 'Password',
                width: 650,
                controller: passwordController,
                obscureText: controller.isVisibilty,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.visibilty();
                  },
                  icon: Icon(
                    controller.isVisibilty
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                hintText: 'password',
                textInputType: TextInputType.visiblePassword,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            DefaultTextFormField(
              helperText: 'Email',
              cursorAndPrefixIconColor: Colors.black,
              borderColor: Colors.black,
              focusedColor: Colors.black,
              hintText: 'email address',
              controller: usernameController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 50,
            ),
            DefaultButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  return;
                  // setState(() {
                  //   DioHelper.postData(url: lOGIN, data: {
                  //     'email': 'user@gmail.com',
                  //     'password': 'password',
                  //   }).then((value) {
                  //     loginModel = LoginModel.fromJson(value.data);
                  //     print('access Token :  ${loginModel?.accessToken}');
                  //     print('message :  ${loginModel?.message}');
                  //     print('Token Type :  ${loginModel?.tokenType}');
                  //     print('expired in  :  ${loginModel?.expiresIn}');
                  //   }).catchError((error) {
                  //     print('Error : $error');
                  //   });
                  // });
                }
              },
              colorButton: ColorsManager.colorButton1,
              child: Text(
                'SignUp',
                style: TextStyles.rem14Bold.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
