import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Archive_complaints/view/ArchiveComplaintsWidget/archive_complaints_list.dart';
import 'package:flutter_application_1/citizen/Archive_complaints/view/ArchiveComplaintsWidget/archive_const_title.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_arrow_back.dart';

class ArchiveComplaintsPage extends StatelessWidget {
  const ArchiveComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: ComplaintArrowBack(),
          title: ArchiveConstTitle(),
        ),
        body: SingleChildScrollView(
          child: Column(children: [ArchiveComplaintsList()]),
        ),
      ),
    );
  }
}
