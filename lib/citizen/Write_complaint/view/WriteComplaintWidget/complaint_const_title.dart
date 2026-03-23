import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class ComplaintConstTitle extends StatelessWidget {
  const ComplaintConstTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Static.getwidth(context, 6);
    final height = Static.getheight(context, 4);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height, right: width),
                child: Text(
                  ': ملاحظات حول تقديم الشكوى',
                  style: TextStyle(
                    fontFamily: Static.cairo,
                    fontWeight: FontWeight.w400,
                    fontSize: Static.getwidth(context, 19),
                    color: Static.basiccolor,
                  ),
                ),
              ),
              Container(
                width: Static.getwidth(context, 10),
                height: Static.getheight(context, 10),
                decoration: BoxDecoration(
                  color: Static.basiccolor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: width),
            child: Text(
              ' عند إرسال الشكوى للجهة المعنية سوف يظهر اسمك ومعلوماتك * ',
              style: TextStyle(
                fontFamily: Static.cairo,
                fontWeight: FontWeight.w100,
                fontSize: Static.getwidth(context, 14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width),
            child: Text(
              ' من الممكن أن يتم التواصل معك و طلب تفاصيل اضافية عند الحاجة * ',
              style: TextStyle(
                fontFamily: Static.cairo,
                fontWeight: FontWeight.w100,
                fontSize: Static.getwidth(context, 14),
              ),
            ),
          ),
          SizedBox(height: Static.getheight(context, 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: width),
                child: Text(
                  ': الرجاء ملأ النموذج التالي ',
                  style: TextStyle(
                    fontFamily: Static.cairo,
                    fontWeight: FontWeight.w700,
                    fontSize: Static.getwidth(context, 20),
                    color: Static.basiccolor,
                  ),
                ),
              ),
              Container(
                width: Static.getwidth(context, 10),
                height: Static.getheight(context, 10),
                decoration: BoxDecoration(
                  color: Static.basiccolor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
