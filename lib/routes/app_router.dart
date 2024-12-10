import 'package:get/get.dart';
import 'package:lab_nerd/logic/bindings/app_binding.dart';
import 'package:lab_nerd/logic/bindings/auth_binding.dart';
import 'package:lab_nerd/views/auth/forgot_password_view.dart';
import 'package:lab_nerd/views/boarding_page.dart';
import 'package:lab_nerd/views/home/chat_gpt_view.dart';
import 'package:lab_nerd/views/home/edit_profile_view.dart';
import 'package:lab_nerd/views/home/elements_list_view.dart';
import 'package:lab_nerd/views/home/search_element_view.dart';
import 'package:lab_nerd/views/layout/exams_view.dart';
import 'package:lab_nerd/views/layout/experiment_view.dart';
import 'package:lab_nerd/views/auth/login_layout.dart';
import 'package:lab_nerd/views/auth/signup_layout.dart';
import 'package:lab_nerd/views/layout/home_layout.dart';
import 'package:lab_nerd/views/layout/periodic_table_view.dart';
import 'package:lab_nerd/views/home/quizes_view.dart';
import 'package:lab_nerd/views/layout/settings_view.dart';
import 'package:lab_nerd/views/layout/unity_view.dart';
import 'package:lab_nerd/views/splash_view.dart';

class AppRouter {
  //inital route
  static const initalView = Routes.splashView;

  //get pages
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.splashView,
      page: () => const SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.onBoardingView,
      page: () => BoardingPage(),
    ),
    GetPage(
      name: Routes.loginView,
      page: () => const LoginLayout(),
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
        name: Routes.homeView,
        page: () => const HomeLayout(),
        bindings: [AuthBinding(), AppBinding()]),
    GetPage(
      name: Routes.periodicTableView,
      page: () => const PeriodicTableView(),
    ),
    GetPage(
      name: Routes.experimentView,
      page: () => const ExperimentView(),
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
      name: Routes.unityView,
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

class Routes {
  static const splashView = '/splashView';
  static const onBoardingView = '/onBoardingView';
  static const loginView = '/loginView';
  static const signupView = '/signupView';
  static const forgotPasswordView = '/forgotPasswordView';
  static const homeView = '/homeView';
  static const periodicTableView = '/peridocTableView';
  static const experimentView = '/ExperimentView';
  static const examsView = '/ExamsView';
  static const quizesView = '/QuizesView';
  static const settingsView = '/SettingsView';
  static const unityView = '/unityView';
  static const editProfileView = '/editProfileView';
  static const chatGptView = '/chatGptView';
  static const elementsListView = '/elementsListView';
  static const searchElementView = '/searchElementView';
}
