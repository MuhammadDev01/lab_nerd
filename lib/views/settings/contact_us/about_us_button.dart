import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showContactSheet(context),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.brown,
            ),
            child: const Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Contact Us",
            style: TextStyles.rem20Boldd,
          ),
        ],
      ),
    );
  }

  void showContactSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            children: [
              Center(
                child: Text("📞 Contact Us",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Send Email"),
                onTap: () =>
                    launchUrl(Uri.parse("muhammadbenkhaled@gmail.com")),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Call Us"),
                onTap: () => launchUrl(Uri.parse("tel:+201029036889")),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text("Chat on WhatsApp"),
                onTap: () =>
                    launchUrl(Uri.parse("https://wa.me/+201029036889")),
              ),
            ],
          ),
        );
      },
    );
  }
}
