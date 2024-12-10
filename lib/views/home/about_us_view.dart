import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/utils/app_style.dart';
import 'package:lab_nerd/widgets/auth/arrow_back_widget.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            Assets.backgroundLight,
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                WhoWeAreTile(
                  ques: 'Who We Are',
                  answer:
                      'We are a team of dedicated professionals committed to providing exceptional service and solutions. Our mission is to develop practical skills and reduce experiment execution time, ensuring a more practicable user experience.',
                ),
                SizedBox(
                  height: 20,
                ),
                WhoWeAreTile(
                  ques: 'How We Are Work',
                  answer:
                      '''We are using 3d technology to build a laboratory which enable any one from any place at any time to do their scientific Experiment  
* Providing safe experimentswithout any risk.
* Reducing the negative effects of the use of  chemicals.
* Availability of experiments in any place and at any time.
* Reducing the cost of tools and elements.
            ''',
                ),
                SizedBox(
                  height: 20,
                ),
                MissionCard(
                  title: 'Our Mission',
                  content: 'Developing students practical skills.\n\n'
                      'Reducing experiments execution time.\n\n'
                      'Providing more practicable user experience.',
                  icon: Icons.track_changes,
                  color: Colors.teal,
                  colorIcon: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                MissionCard(
                  title: 'Our Plan',
                  content:
                      'Improve quality of lab experience like models and animation.\n\n'
                      'Increase accuracy of experiments by scientific content creators.\n\n',
                  icon: FontAwesomeIcons.medal,
                  color: Colors.pink,
                  colorIcon: Colors.amber,
                ),
                SizedBox(
                  height: 20,
                ),
                MissionCard(
                  title: 'Our Vision',
                  content: 'Extend to cover various sections of subjects.\n\n'
                      'Platforms be available on different platforms like ios and web phoneand produce a 3d version for lab .\n\n',
                  icon: FontAwesomeIcons.glasses,
                  color: Colors.blueGrey,
                  colorIcon: Colors.teal,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ArrowbackWidget(
                  background: Colors.transparent,
                  color: Colors.black,
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  'About US',
                  style: AppStyle.interF14w600.copyWith(
                    fontSize: 24,
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhoWeAreTile extends StatelessWidget {
  const WhoWeAreTile({super.key, required this.ques, required this.answer});
  final String ques;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.black,
      title: Text(
        ques,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'REM',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'REM',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class MissionCard extends StatelessWidget {
  const MissionCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
    required this.colorIcon,
  });
  final String title;
  final String content;
  final IconData icon;
  final Color color;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Color(0xFFF5D6BA), Color(0xFFBAF0F7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 30,
              color: colorIcon,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: 'REM',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'REM',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
