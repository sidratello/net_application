import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ComplaintWriteButton extends StatelessWidget {
  final BuildContext oldContext;

  const ComplaintWriteButton({super.key, required this.oldContext});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ComplaintCubit, ComplaintState>(
      listener: (context, state) {
        if (state is ComplaintFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is ComplaintSuccess) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text("File uploaded successfully ✅")),
          // );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () async {
            bool result = await context
                .read<ComplaintCubit>()
                .postNewComplaint();
            if (!oldContext.mounted) return;
            Static.showCustomSnackbar(
              oldContext,
              oldContext.read<ComplaintCubit>().message,
            );
            if (result) {
              await context.read<ComplaintCubit>().getComplaints();
              GoRouter.of(oldContext).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Static.basiccolor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'إرسال الشكوى',
            style: TextStyle(
              fontFamily: Static.cairo,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
        ),
      ),
    );
  }
}
