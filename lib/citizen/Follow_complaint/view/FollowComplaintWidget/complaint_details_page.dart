import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Follow_complaint/view/FollowComplaintWidget/step_item.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintDetailsPage extends StatelessWidget {
  const ComplaintDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final complaint = context.read<ComplaintCubit>().complaintsModel;
    int complaintNumber =
        complaint!.complaints![complaint.complaints!.length - 1].id!;
    String department = complaint
        .complaints![complaint.complaints!.length - 1]
        .governmentAgencyName!;
    String statusText =
        complaint.complaints![complaint.complaints!.length - 1].statusName!;

    Color activeColor = Colors.green;
    Color inactiveColor = Colors.grey;
    Color rejectedColor = Colors.red;
    double padding = 14;
    double horizontal = Static.getwidth(context, 16);
    double vertical = Static.getheight(context, 10);

    return BlocConsumer<ComplaintCubit, ComplaintState>(
      listener: (context, state) {
        if (state is ComplaintFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is ComplaintFailure) {
          return Padding(
            padding: EdgeInsets.all(Static.getwidth(context, padding)),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(Static.getwidth(context, padding)),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F8F4),
                borderRadius: BorderRadius.circular(
                  Static.getwidth(context, 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Static.getwidth(context, 100),
                    height: Static.getheight(context, 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Static.getwidth(context, 16),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/citizen.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: Static.getheight(context, 16)),

                  const Text(
                    "لا توجد شكاوى حالياً",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 103, 199, 140),
                      fontFamily: "Cairo",
                    ),
                  ),

                  SizedBox(height: Static.getheight(context, 8)),

                  const Text(
                    "عند تقديم شكوى جديدة، ستظهر هنا تفاصيلها.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ComplaintSuccess) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: Static.getheight(context, 20),
              horizontal: Static.getwidth(context, 20),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "الشكوى رقم $complaintNumber",
                  style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: activeColor,
                  ),
                ),
                SizedBox(height: Static.getheight(context, 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      department,
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 16,
                        color: inactiveColor,
                      ),
                    ),
                    SizedBox(width: Static.getwidth(context, 6)),
                    Icon(
                      Icons.account_balance,
                      color: inactiveColor,
                      size: Static.getwidth(context, 20),
                    ),
                  ],
                ),
                SizedBox(height: Static.getheight(context, 20)),

                if (statusText == "مرفوضة")
                  Center(
                    child: Text(
                      "مرفوضة",
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: rejectedColor,
                      ),
                    ),
                  )
                else ...[
                  Text(
                    "حالة الشكوى",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: activeColor,
                    ),
                  ),
                  SizedBox(height: Static.getheight(context, 14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stepItem(
                        " جديدة",
                        Icons.radio_button_unchecked,
                        statusText == "جديدة",
                        activeColor,
                        inactiveColor,
                      ),
                      Container(
                        height: Static.getheight(context, 1),
                        width: Static.getwidth(context, 40),
                        color: inactiveColor,
                      ),
                      stepItem(
                        "قيد المعالجة",
                        Icons.work_history,
                        statusText == "قيد المعالجة",
                        activeColor,
                        inactiveColor,
                      ),
                      Container(
                        height: Static.getheight(context, 1),
                        width: Static.getwidth(context, 40),
                        color: inactiveColor,
                      ),
                      stepItem(
                        "منجزة",
                        Icons.check_circle,
                        statusText == "منجزة",
                        activeColor,
                        inactiveColor,
                      ),
                    ],
                  ),
                  SizedBox(height: Static.getheight(context, 20)),
                  Text(
                    "تم استقبال الشكوى من قبل الجهة المختصة وسيتم استلام اشعار عند تحديث الحالة.",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 14,
                      color: inactiveColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  if (complaint
                              .complaints![complaint.complaints!.length - 1]
                              .notes !=
                          null &&
                      complaint
                          .complaints![complaint.complaints!.length - 1]
                          .notes!
                          .trim()
                          .isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontal,
                        vertical: vertical,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade100.withOpacity(0.5),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  ': ملاحظات ',
                                  style: TextStyle(
                                    fontFamily: Static.cairo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                                SizedBox(height: horizontal),
                                Text(
                                  complaint
                                      .complaints![complaint
                                              .complaints!
                                              .length -
                                          1]
                                      .notes!,
                                  style: TextStyle(
                                    fontFamily: Static.cairo,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.green.shade800,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),

                          Icon(
                            Icons.note_alt,
                            color: Static.basiccolor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                ],
              ],
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
