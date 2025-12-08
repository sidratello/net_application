import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/core/utils/app_router.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeCitizenContainer extends StatelessWidget {
  const HomeCitizenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = 14;
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
          final complaint = context
              .read<ComplaintCubit>()
              .complaintsModel!
              .complaints!;
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: Static.getwidth(context, 90),
                        height: Static.getheight(context, 90),
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

                      SizedBox(width: Static.getwidth(context, 16)),

                      Expanded(
                        child: Text(
                          "الشكوى الحالية رقمها ${complaint[complaint.length - 1].id}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 103, 199, 140),
                            fontFamily: "Cairo",
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Static.getheight(context, 14)),

                  const Text(
                    "يمكنك متابعة تفاصيل الشكوى و تصفح المعلومات المرتبطة بها",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: Static.getwidth(context, 16)),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.followComplaint);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 103, 199, 140),
                          borderRadius: BorderRadius.circular(
                            Static.getwidth(context, 12),
                          ),
                        ),
                        child: const Text(
                          "عرض التفاصيل",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
