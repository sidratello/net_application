import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Follow_complaint/view/FollowComplaintWidget/complaint_details_page.dart';
import 'package:flutter_application_1/citizen/Follow_complaint/view/FollowComplaintWidget/follow_complaint_appbar_title.dart';
import 'package:flutter_application_1/citizen/Follow_complaint/view/FollowComplaintWidget/follow_image.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_arrow_back.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class FollowComplaintPage extends StatelessWidget {
  const FollowComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
          leading: ComplaintArrowBack(),
          title: FollowComplaintAppbarTitle(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Static.getheight(context, 16),
            horizontal: Static.getwidth(context, 16),
          ),

          child: Column(
            children: [
              FollowImage(),
              SizedBox(height: Static.getheight(context, 20)),
              ComplaintDetailsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
