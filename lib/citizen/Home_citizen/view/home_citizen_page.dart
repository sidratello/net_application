import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Home_citizen/view/HomeCitizenWidget/home_citizen_appbar_title.dart';
import 'package:flutter_application_1/citizen/Home_citizen/view/HomeCitizenWidget/home_citizen_archive.dart';
import 'package:flutter_application_1/citizen/Home_citizen/view/HomeCitizenWidget/home_citizen_container.dart';
import 'package:flutter_application_1/citizen/Home_citizen/view/HomeCitizenWidget/home_citizen_notification.dart';
import 'package:flutter_application_1/citizen/Home_citizen/view/HomeCitizenWidget/home_citizen_write_complaint.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCitizenPage extends StatelessWidget {
  const HomeCitizenPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ComplaintCubit>().getComplaints();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: HomeCitizenAppbarTitle(),
          actions: [HomeCitizenNotification()],
        ),
        body: Column(
          children: [
            HomeCitizenContainer(),
            HomeCitizenWriteComplaint(),
            HomeCitizenArchive(),
          ],
        ),
      ),
    );
  }
}
