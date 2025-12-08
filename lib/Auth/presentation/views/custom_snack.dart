// import 'package:flutter/material.dart';

// void showBeautifulSnackBar(
//   BuildContext context, {
//   required String message,

//   Color backgroundColor = const Color.fromARGB(255, 214, 206, 206),
//   Color textColor = const Color.fromARGB(255, 5, 5, 5),
// }) {
//   final snackBar = SnackBar(
//     // يجعلها تطفو فوق المحتوى
//     elevation: 0,
//     backgroundColor: Colors.transparent, // مهم لأنه يخلي الستيل حلو

//     content: Container(
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
         
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [

//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               message,
//               style: TextStyle(
//                 color: textColor,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 height: 1.3,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );

//   ScaffoldMessenger.of(context)
//     ..clearSnackBars()
//     ..showSnackBar(snackBar);
// }
