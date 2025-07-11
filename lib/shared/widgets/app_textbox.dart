// import 'package:virtueinsight/core/config/config.dart';

// class AppTextField extends StatelessWidget {
//   final String hintText;
//   final IconData? prefixIcon;
//   final TextEditingController controller;
//   final bool obscureText;
//   final bool showSuffixIcon;
//   final VoidCallback? onSuffixTap;
//   final IconData? suffixIcon;
//   final TextInputType keyboardType;
//   final TextInputAction textInputAction;
//   final FormFieldValidator<String>? validator;
//   final void Function(String)? onFieldSubmitted;

//   const AppTextField({
//     required this.hintText,
//     required this.controller,
//     super.key,
//     this.prefixIcon,
//     this.obscureText = false,
//     this.showSuffixIcon = false,
//     this.onSuffixTap,
//     this.suffixIcon,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.next,
//     this.validator,
//     this.onFieldSubmitted,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,

//       textInputAction: textInputAction,
//       validator: validator,
//       style: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
//         color: Theme.of(context).highlightColor,
//       ),
//       onFieldSubmitted: onFieldSubmitted,
//       decoration: InputDecoration(
//         hintText: hintText,
//         isDense: true,
//         filled: true,
//         hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(color: Theme.of(context).focusColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(color: Theme.of(context).focusColor),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(color: Theme.of(context).focusColor),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           borderSide: BorderSide(color: AppColors.red.withValues(alpha: 0.48)),
//         ),

//         prefixIcon:
//             prefixIcon != null
//                 ? IconButton(
//                   onPressed: null,
//                   icon: FaIcon(prefixIcon, color: Theme.of(context).focusColor),
//                 )
//                 : null,
//         suffixIcon:
//             showSuffixIcon && suffixIcon != null
//                 ? IconButton(
//                   onPressed: onSuffixTap,
//                   icon: FaIcon(suffixIcon, color: Theme.of(context).focusColor),
//                 )
//                 : null,
//       ),
//     );
//   }
// }

// class AppTextField1 extends StatelessWidget {
//   final String hintText;
//   final String? titleText;
//   final String? prefixIconPath;
//   final TextEditingController controller;
//   final bool obscureText;
//   final bool showSuffixIcon;
//   final int? maxLines;

//   final VoidCallback? onSuffixTap;
//   final String? suffixIconPath;
//   final TextInputType keyboardType;
//   final TextInputAction textInputAction;
//   final FormFieldValidator<String>? validator;
//   final bool readOnly;

//   const AppTextField1({
//     required this.controller,
//     required this.hintText,
//     super.key,
//     this.prefixIconPath,
//     this.titleText,
//     this.obscureText = false,
//     this.showSuffixIcon = false,
//     this.onSuffixTap,
//     this.readOnly = false,
//     this.suffixIconPath,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction = TextInputAction.next,
//     this.maxLines = 1,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           titleText ?? '',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Theme.of(context).highlightColor,
//           ),
//         ),
//         AppSpacing.h10,
//         TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           keyboardType: keyboardType,
//           maxLines: maxLines,
//           textInputAction: textInputAction,
//           validator: validator,
//           readOnly: readOnly,
//           decoration: InputDecoration(
//             isDense: true,
//             hintText: hintText,
//             hintStyle: TextStyle(
//               color: Theme.of(context).iconTheme.color ?? AppColors.border,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Theme.of(context).iconTheme.color ?? AppColors.border,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Theme.of(context).iconTheme.color ?? AppColors.border,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Theme.of(context).iconTheme.color ?? AppColors.border,
//               ),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Theme.of(context).iconTheme.color ?? AppColors.border,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
