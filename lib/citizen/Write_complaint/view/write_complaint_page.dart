import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_arrow_back.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_const_title.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_description_field.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_drop.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_load_images.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_load_pdfs.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_type_field.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/complaint_write_button.dart';
import 'package:flutter_application_1/citizen/Write_complaint/view/WriteComplaintWidget/write_complaint_title.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WriteComplaintPage extends StatelessWidget {
  const WriteComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ComplaintCubit>().getAgencyName();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: const ComplaintArrowBack(),
          title: const WriteComplaintTitle(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ComplaintConstTitle(),
              const ComplaintTypeField(),
              SizedBox(height: Static.getheight(context, 8)),
              ComplaintTypeDropdown(),
              SizedBox(height: Static.getheight(context, 8)),
              ComplaintDescriptionField(),
              SizedBox(height: Static.getheight(context, 12)),
              ComplaintLoadImages(),
              ComplaintLoadPdfs(),
            ],
          ),
        ),
        bottomNavigationBar: ComplaintWriteButton(oldContext: context),
      ),
    );
  }
}
