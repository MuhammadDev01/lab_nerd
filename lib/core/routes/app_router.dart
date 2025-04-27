import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/bindings/app_binding.dart';
import 'package:lab_nerd/core/logic/bindings/auth_binding.dart';
import 'package:lab_nerd/core/logic/bindings/splash_binding.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/views/home/quizzes/quizes_view.dart';
import 'package:lab_nerd/views/onbaording/onboarding_view.dart';
import 'package:lab_nerd/views/home/chat_gpt/chat_gpt_view.dart';
import 'package:lab_nerd/views/settings/edit_profile_view.dart';
import 'package:lab_nerd/views/exams/widgets/elements_list_view.dart';
import 'package:lab_nerd/views/home/search_elements/search_element_view.dart';
import 'package:lab_nerd/views/exams/exams_view.dart';
import 'package:lab_nerd/views/auth/login/login_view_builder.dart';
import 'package:lab_nerd/views/auth/signup/signup_layout.dart';
import 'package:lab_nerd/views/main/main_view_adaptive.dart';
import 'package:lab_nerd/views/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/settings/settings_view.dart';
import 'package:lab_nerd/views/home/home_view.dart';
import 'package:lab_nerd/views/splash/splash_view.dart';

class AppRouter {
  //inital route
  static const initalView = Routes.splashView;

  //get pages
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.splashView,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onBoardingView,
      page: () => OnboardingView(),
    ),
    GetPage(
      name: Routes.loginView,
      page: () => const LoginViewBuilder(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupView,
      page: () => const SignupLayout(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordView,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.mainView,
        page: () => const MainViewAdaptive(),
        bindings: [
          AuthBinding(),
          AppBinding(),
        ]),
    GetPage(
      name: Routes.periodicTableView,
      page: () => const PeriodicTableView(),
    ),
    GetPage(
      name: Routes.examsView,
      page: () => const ExamsView(),
    ),
    GetPage(
      name: Routes.quizesView,
      page: () => const QuizesView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.settingsView,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.editProfileView,
      page: () => const EditProfileView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.chatGptView,
      page: () => ChatGptView(),
    ),
    GetPage(
      name: Routes.elementsListView,
      page: () => const ElementsListView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.searchElementView,
      page: () => const SearchElementView(),
      binding: AppBinding(),
    ),
  ];
}
