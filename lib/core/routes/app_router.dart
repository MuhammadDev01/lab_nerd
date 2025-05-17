import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/bindings/main_binding.dart';
import 'package:lab_nerd/core/logic/bindings/auth_binding.dart';
import 'package:lab_nerd/core/logic/bindings/splash_binding.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/views/home/my_notes/my_notes_view.dart';
import 'package:lab_nerd/views/home/quizzes/quizzes_view.dart';
import 'package:lab_nerd/views/onbaording/onboarding_view.dart';
import 'package:lab_nerd/views/home/chat_gpt/chat_gpt_view.dart';
import 'package:lab_nerd/views/settings/change_username/change_username_view.dart';
import 'package:lab_nerd/views/home/search_elements/search_element_view.dart';
import 'package:lab_nerd/views/exam/exam_view.dart';
import 'package:lab_nerd/views/auth/login/login_view_builder.dart';
import 'package:lab_nerd/views/auth/signup/signup_layout.dart';
import 'package:lab_nerd/views/main/main_view_adaptive.dart';
import 'package:lab_nerd/views/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/settings/settings_view.dart';
import 'package:lab_nerd/views/home/home_view.dart';
import 'package:lab_nerd/views/splash/splash_view.dart';

class AppRouter {
  static const initalView = Routes.splashView;

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
      name: Routes.loginView,
      page: () => const LoginViewBuilder(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupView,
      page: () => const SignupLayout(),
    ),
    GetPage(
      name: Routes.forgotPasswordView,
      page: () => const ForgotPasswordView(),
    ),
    //** Main **\\
    GetPage(
      name: Routes.mainView,
      page: () => const MainViewAdaptive(),
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
