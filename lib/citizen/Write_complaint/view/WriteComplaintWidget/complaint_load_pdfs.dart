import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintLoadPdfs extends StatelessWidget {
  const ComplaintLoadPdfs({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 30);
    double vertical = Static.getheight(context, 12);
    return BlocConsumer<ComplaintCubit, ComplaintState>(
      listener: (context, state) {
        if (state is ComplaintSuccess &&
            context.read<ComplaintCubit>().message.isNotEmpty) {
          Static.showCustomSnackbar(
            context,
            context.read<ComplaintCubit>().message,
          );
        } else if (state is ComplaintFailure) {
          Static.showCustomSnackbar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ComplaintCubit>();

        return SizedBox(
          height: Static.getheight(context, 270),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '.. يمكنك إرفاق الوثائق هنا',
                style: TextStyle(
                  fontFamily: Static.cairo,
                  fontWeight: FontWeight.w500,
                  color: Static.basiccolor,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: vertical,
                  horizontal: horizontal,
                ),
                child: InkWell(
                  onTap: () {
                    cubit.getPdfFile();
                  },
                  child: Container(
                    height: Static.getheight(context, 208),
                    width: Static.getwidth(context, 300),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 1),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Download.png',
                            height: Static.getheight(context, 100),
                            width: Static.getwidth(context, 100),
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cubit.pdfFile != null
                                //null != null
                                ? "تم الاختيار بنجاح ✅"
                                : "اضغط للاختيار ",
                            style: TextStyle(
                              fontFamily: Static.cairo,
                              fontWeight: FontWeight.w400,
                              fontSize: Static.getwidth(context, 14),
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
