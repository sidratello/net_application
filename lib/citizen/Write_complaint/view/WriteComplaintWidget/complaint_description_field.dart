import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintDescriptionField extends StatelessWidget {
  const ComplaintDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Static.getwidth(context, 6);
    final height = Static.getheight(context, 6);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Static.getwidth(context, 250),
            minHeight: Static.getheight(context, 100),
          ),
          child: BlocBuilder<ComplaintCubit, ComplaintState>(
            builder: (context, state) {
              final description = context
                  .read<ComplaintCubit>()
                  .complaintDescription;

              return TextFormField(
                initialValue: description,
                maxLines: null,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: '.. اكتب وصف الشكوى هنا',
                  hintStyle: TextStyle(
                    fontFamily: Static.cairo,
                    fontWeight: FontWeight.w400,
                    fontSize: Static.getwidth(context, 14),
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                ),
                onChanged: (value) {
                  // تحديث النص مباشرة في Cubit
                  context.read<ComplaintCubit>().changecomplaintDescription(
                    value,
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
          child: Text(
            ': وصف الشكوى',
            style: TextStyle(
              fontFamily: Static.cairo,
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 19),
              color: Static.basiccolor,
            ),
          ),
        ),
      ],
    );
  }
}
