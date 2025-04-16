import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ChatGptView extends StatelessWidget {
//   ChatGptView({super.key}) {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onHttpError: (HttpResponseError error) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://chatgpt.com/'));
//   }

//   late WebViewController controller;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: WebViewWidget(
//         controller: controller,
//       ),
//     );
//   }
// }

class ChatGptView extends StatelessWidget {
  const ChatGptView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}