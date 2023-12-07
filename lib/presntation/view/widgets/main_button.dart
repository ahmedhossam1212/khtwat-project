import 'package:flutter/material.dart';
import 'package:khtwat_project/core/utils/app_colors.dart';
import 'package:khtwat_project/core/utils/media_query_values.dart';
import 'package:khtwat_project/core/utils/style_manager.dart';

Widget mainButton(
  BuildContext context, {
  required VoidCallback onpressd,
  required Color background,
  required String text,
}) =>
    Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: MaterialButton(
        minWidth: double.infinity,
        height: context.height * 0.07,
        onPressed: onpressd,
        color: background,
        child: Text(
          text,
          style: getRegularStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
