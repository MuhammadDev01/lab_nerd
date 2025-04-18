import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/signup/signup_view_tablet.dart';

class CustomForgotPasswordAppbar extends StatelessWidget {
  const CustomForgotPasswordAppbar({super.key, required this.nameView});
  final String nameView;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12, left: 8),
          decoration: BoxDecoration(
            color: const Color(0xffE7B86C),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 210,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                nameView,
                style: TextStyles.rem14Bold.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const Align(
          alignment: AlignmentDirectional(-1.0, 0),
          child: BackArrow(
            backgroundColor: Colors.grey,
            arrowColor: Colors.black,
          ),
        ),
      ],
    );
  }
}

// class ArrowbackWidget extends StatelessWidget {
//   const ArrowbackWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       backgroundColor: const Color(0xff949089),
//       child: IconButton(
//         padding: EdgeInsets.zero,
//         onPressed: () {
//           Get.back();
//         },
//         icon: const Icon(
//           Icons.arrow_back,
//           size: 30,
//         ),
//       ),
//     );
//   }
// }
