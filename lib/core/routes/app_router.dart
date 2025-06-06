import 'package:get/get.dart';
import 'package:lab_nerd/core/bindings/main_binding.dart';
import 'package:lab_nerd/core/bindings/auth_binding.dart';
import 'package:lab_nerd/core/bindings/splash_binding.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/views/main/screens/home/home_view.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/my_notes_view.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/quizzes_view.dart';
import 'package:lab_nerd/views/main/main_view.dart';
import 'package:lab_nerd/views/onbaording/onboarding_view.dart';
import 'package:lab_nerd/views/main/screens/home/chat_gpt/chat_gpt_view.dart';
import 'package:lab_nerd/views/main/screens/settings/change_username/change_username_view.dart';
import 'package:lab_nerd/views/main/screens/home/search_elements/search_element_view.dart';
import 'package:lab_nerd/views/main/screens/exam/exam_view.dart';
import 'package:lab_nerd/views/auth/auth_view_builder.dart';
import 'package:lab_nerd/views/main/screens/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/main/screens/settings/settings_view.dart';
import 'package:lab_nerd/views/splash/splash_view.dart';

class AppRouter {
  //*get pages
  static final List<GetPage<dynamic>> routes = [
    //** Splash **\\
    GetPage(
      name: Routes.splashView,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onBoardingView,
      page: () => OnboardingView(),
    ),
    //** Auth **\\
    GetPage(
      name: Routes.authView,
      page: () => const AuthViewBuilder(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordView,
      page: () => const ForgotPasswordView(),
    ),
    //** Main **\\
    GetPage(
      name: Routes.mainView,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.chatGptView,
      page: () => const ChatGptView(),
    ),
    GetPage(
      name: Routes.searchElementView,
      page: () => const SearchElementView(),
    ),
    GetPage(
      name: Routes.quizesView,
      page: () => const QuizzesView(),
    ),
    GetPage(
      name: Routes.myNotesView,
      page: () => const MyNotesView(),
    ),

    //**Nav Bar *\\
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.periodicTableView,
      page: () => const PeriodicTableView(),
    ),
    GetPage(
      name: Routes.examView,
      page: () => const ExamView(),
    ),
    GetPage(
      name: Routes.settingsView,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: Routes.changeUsername,
      page: () => const ChangeUsernameView(),
    ),
  ];
}
