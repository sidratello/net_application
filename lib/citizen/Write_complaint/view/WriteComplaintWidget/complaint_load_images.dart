import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class ComplaintLoadImages extends StatelessWidget {
  const ComplaintLoadImages({super.key});

  @override
  Widget build(BuildContext context) {
    double vertical = Static.getheight(context, 12);
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = (screenWidth - 60) / 3;

    return BlocConsumer<ComplaintCubit, ComplaintState>(
      listener: (context, state) {
        if (state is ComplaintSuccess &&
            context.read<ComplaintCubit>().message.isNotEmpty) {
          Static.showCustomSnackbar(
            context,
            context.read<ComplaintCubit>().message,
          );
          print(
            "Listener: ComplaintSuccess - message: ${context.read<ComplaintCubit>().message}",
          );
        } else if (state is ComplaintFailure) {
          Static.showCustomSnackbar(context, state.errorMessage);
          print(
            "Listener: ComplaintFailure - errorMessage: ${state.errorMessage}",
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<ComplaintCubit>();
        print("Builder: Current images count: ${cubit.imagess.length}");

        return SizedBox(
          height: Static.getheight(context, 250),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '.. يمكنك إرفاق الصور هنا',
                style: TextStyle(
                  fontFamily: Static.cairo,
                  fontWeight: FontWeight.w500,
                  color: Static.basiccolor,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
              SizedBox(height: vertical),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  // زر إضافة صورة إذا العدد أقل من 3
                  if (cubit.imagess.length < 3)
                    InkWell(
                      onTap: () async {
                        print("Tapped add image button");
                        final picker = ImagePicker();
                        final pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 80,
                        );
                        if (pickedFile != null) {
                          print("Picked file path: ${pickedFile.path}");
                          cubit.addImage(File(pickedFile.path));
                          print(
                            "Images count after add: ${cubit.imagess.length}",
                          );
                        } else {
                          print("No file selected");
                        }
                      },
                      child: Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromRGBO(200, 200, 200, 1),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.add, size: 40, color: Colors.grey),
                        ),
                      ),
                    ),
                  // عرض الصور المختارة
                  ...cubit.imagess.map(
                    (image) => Stack(
                      children: [
                        Container(
                          height: imageSize,
                          width: imageSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -5,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              print("Removing image: ${image.path}");
                              cubit.removeImage(image);
                              print(
                                "Images count after remove: ${cubit.imagess.length}",
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
