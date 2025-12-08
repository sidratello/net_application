import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:go_router/go_router.dart';

class HomeCitizenArchive extends StatelessWidget {
  const HomeCitizenArchive({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = 14;
    double horizontal = Static.getwidth(context, 16);
    double vertical = Static.getheight(context, 8);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.archiveComplaint);
      },
      child: Container(
        padding: EdgeInsets.all(Static.getwidth(context, padding)),
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Static.getwidth(context, 16)),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(Static.getwidth(context, padding)),
              decoration: BoxDecoration(
                color: Static.basiccolor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.folder_copy_outlined,
                color: Static.basiccolor,
                size: Static.getwidth(context, 28),
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "جميع الشكاوى السابقة",
                    style: TextStyle(
                      fontFamily: Static.cairo,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "تصفح سجل الشكاوى التي قمت بإرسالها مسبقاً",
                    style: TextStyle(
                      fontFamily: Static.cairo,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Static.getwidth(context, padding)),
              child: Icon(
                Icons.arrow_forward_ios,
                size: Static.getwidth(context, 20),
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
