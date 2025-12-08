import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Archive_complaints/model/complaints_model.dart';
import 'package:flutter_application_1/citizen/Write_complaint/model/agency_name_model.dart';
import 'package:flutter_application_1/core/utils/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit() : super(ComplaintInitial());

  String agencyType = "";
  String complaintType = "";
  String complaintDescription = "";
  int idAgency = 0;

  int idComplaint = 1;
  //List<XFile>? images = [];
  String message = '';
  XFile? pdfFile;

  void changeField(String text, int id) {
    agencyType = text;
    idAgency = id;
    emit(ComplaintSuccess());
  }

  void changeType(String text) {
    complaintType = text;
    emit(ComplaintSuccess());
  }

  void changecomplaintDescription(String text) {
    complaintDescription = text;
    emit(ComplaintSuccess());
  }

  Future<void> getPdfFile() async {
    const XTypeGroup pdfType = XTypeGroup(label: 'PDF', extensions: ['pdf']);

    final XFile? file = await openFile(acceptedTypeGroups: [pdfType]);

    if (file != null) {
      pdfFile = file;
      emit(ComplaintSuccess());
    }
  }

  List<File> imagess = [];

  void addImage(File image) {
    if (imagess.length < 3) {
      imagess.add(image);
      emit(ComplaintSuccess());
    }
  }

  void removeImage(File image) {
    imagess.remove(image);
    emit(ComplaintSuccess());
  }

  // Future<void> postImage() async {
  //   ImagePicker imagePicker = ImagePicker();
  //   images = await imagePicker.pickMultiImage();
  //   emit(ComplaintSuccess());
  // }

  ComplaintsModel? complaintsModel;
  Future<void> getComplaints() async {
    emit(ComplaintLoading());

    var response = await ApiService.get(
      endPoint: 'ComplaintStatus/my-complaints',
    );

    if (response['success']) {
      complaintsModel = ComplaintsModel.fromJson(response['data']);

      emit(ComplaintSuccess());
    }
  }

  AgencyNameModel? agencyNameModel;
  Future<void> getAgencyName() async {
    emit(ComplaintLoading());

    var response = await ApiService.get(endPoint: 'GovernmentAgency/all');

    if (response['success']) {
      agencyNameModel = AgencyNameModel.fromJson(response['data']);

      emit(ComplaintSuccess());
    }
  }

  Future<bool> postNewComplaint() async {
    final pdfLength = pdfFile != null ? await pdfFile!.length() : 0;

    print(
      "$agencyType kkkkkkkk $complaintType kkkkkkkk $complaintDescription kkkkkkkk ${imagess.length} kkkkkkkk $pdfLength",
    );

    // التحقق من الحقول المطلوبة
    if (complaintDescription.isEmpty) {
      emit(
        ComplaintFailure(errorMessage: "Please enter the complaintDescription"),
      );
      return false;
    }
    if (complaintType.isEmpty) {
      emit(ComplaintFailure(errorMessage: "Please select a complaintType"));
      return false;
    }
    if (pdfFile == null || pdfLength == 0) {
      emit(ComplaintFailure(errorMessage: "Please upload a file"));
      return false;
    }

    emit(ComplaintLoading());

    // إعداد الـ FormData
    Map<String, dynamic> formMap = {
      'ComplaintType': complaintType,
      'Location': agencyType,
      'Description': complaintDescription,
      'PdfFile': await MultipartFile.fromFile(
        pdfFile!.path,
        filename: pdfFile!.path.split('/').last,
      ),
    };

    // أضف الصور كل وحدة بحقل منفصل: Image1, Image2, Image3
    for (int i = 0; i < imagess.length && i < 3; i++) {
      formMap['Image${i + 1}'] = await MultipartFile.fromFile(
        imagess[i].path,
        filename: imagess[i].path.split('/').last,
      );
    }

    // إرسال البيانات
    var response = await ApiService.post(
      endPoint: 'Complaint/create/$idAgency',
      data: FormData.fromMap(formMap),
    );

    if (response['success']) {
      emit(ComplaintSuccess());
      message = 'Done';
      return true;
    } else {
      message = 'Not Done';
      emit(ComplaintFailure(errorMessage: response['error']));
      return false;
    }
  }
}
