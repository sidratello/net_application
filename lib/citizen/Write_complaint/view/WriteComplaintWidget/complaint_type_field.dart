import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintTypeField extends StatelessWidget {
  const ComplaintTypeField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Static.getwidth(context, 6);
    final height = Static.getheight(context, 6);
    final TextEditingController controller = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Static.getwidth(context, 200),
            ),
            child: TextFormField(
              controller: controller,
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: '.. اكتب نوع الشكوى هنا',
                hintStyle: TextStyle(
                  fontFamily: Static.cairo,
                  fontWeight: FontWeight.w400,
                  fontSize: Static.getwidth(context, 14),
                  color: Colors.black54,
                ),
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                fillColor: Colors.transparent,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.only(bottom: 4, top: 4),
              ),
              onChanged: (value) {
                context.read<ComplaintCubit>().changeType(value);
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
          child: Text(
            ': حدد نوع الشكوى',
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
