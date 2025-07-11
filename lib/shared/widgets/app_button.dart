// import '../../core/config/config.dart';

// class AppButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final double? width;
//   final double? height;
//   final EdgeInsetsGeometry? padding;
//   final double borderRadius;
//   final Color? backgroundColor;
//   final TextStyle? textStyle;

//   const AppButton({
//     required this.text,
//     required this.onPressed,
//     super.key,
//     this.isLoading = false,
//     this.width,
//     this.height,
//     this.padding,
//     this.borderRadius = 8.0,
//     this.backgroundColor,
//     this.textStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor:
//               backgroundColor ?? Theme.of(context).secondaryHeaderColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
//         ),
//         onPressed: isLoading ? () {} : onPressed,
//         child:
//             isLoading
//                 ? const SizedBox(
//                   width: 24,
//                   height: 24,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                     valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
//                   ),
//                 )
//                 : Text(
//                   text,
//                   textAlign: TextAlign.center,
//                   style:
//                       textStyle ??
//                       const TextStyle(
//                         fontSize: 16,
//                         fontFamily: 'DMSans',
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.white,
//                       ),
//                 ),
//       ),
//     );
//   }
// }

// class AppButton1 extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final double? width;
//   final double? height;
//   final EdgeInsetsGeometry? padding;
//   final double borderRadius;
//   final Color? backgroundColor;
//   final TextStyle? textStyle;

//   const AppButton1({
//     required this.text,
//     required this.onPressed,
//     super.key,
//     this.isLoading = false,
//     this.width,
//     this.height,
//     this.padding,
//     this.borderRadius = 8.0,
//     this.backgroundColor,
//     this.textStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           elevation: 0,

//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadius),
//             side: BorderSide(
//               width: 0.5,
//               color: backgroundColor ?? Theme.of(context).focusColor,
//             ),
//           ),
//           padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
//         ),
//         onPressed: isLoading ? () {} : onPressed,
//         child:
//             isLoading
//                 ? const SizedBox(
//                   width: 24,
//                   height: 24,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                     valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
//                   ),
//                 )
//                 : Text(
//                   text,
//                   textAlign: TextAlign.center,
//                   style:
//                       textStyle ??
//                       TextStyle(
//                         fontSize: 14,
//                         fontFamily: 'DMSans',
//                         fontWeight: FontWeight.w400,
//                         color: Theme.of(context).highlightColor,
//                       ),
//                 ),
//       ),
//     );
//   }
// }
