import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Write_complaint/controller/complaint_cubit.dart';
import 'package:flutter_application_1/citizen/Write_complaint/model/agency_name_model.dart';
import 'package:flutter_application_1/core/utils/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintTypeDropdown extends StatelessWidget {
  const ComplaintTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Static.getwidth(context, 6);
    final height = Static.getheight(context, 6);

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
          return _buildDropdownRow(
            context,
            width,
            height,
            [],
            null,
            isEnabled: false,
          );
        } else if (state is ComplaintSuccess) {
          final List<Agencies> agencies =
              context.read<ComplaintCubit>().agencyNameModel?.agencies ?? [];

          Agencies? selectedAgency;
          if (agencies.isNotEmpty) {
            selectedAgency = agencies.firstWhere(
              (e) => e.id == context.read<ComplaintCubit>().idAgency,
              orElse: () => agencies[0],
            );
          }

          return _buildDropdownRow(
            context,
            width,
            height,
            agencies,
            selectedAgency,
            isEnabled: agencies.isNotEmpty,
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

  Widget _buildDropdownRow(
    BuildContext context,
    double width,
    double height,
    List<Agencies> agencies,
    Agencies? selectedAgency, {
    required bool isEnabled,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<Agencies>(
          value: selectedAgency,
          style: TextStyle(
            fontFamily: Static.cairo,
            fontWeight: FontWeight.w400,
            fontSize: Static.getwidth(context, 14),
            color: Colors.black54,
          ),
          dropdownColor: Colors.white,
          items: agencies
              .map(
                (agency) => DropdownMenuItem<Agencies>(
                  value: agency,
                  child: Text(agency.agencyName!),
                ),
              )
              .toList(),
          onChanged: isEnabled
              ? (value) {
                  if (value != null) {
                    context.read<ComplaintCubit>().changeField(
                      value.agencyName!,
                      value.id!,
                    );
                  }
                }
              : null,
        ),
        const SizedBox(width: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
          child: Text(
            ': اختار الجهة المعنية',
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
