import 'package:flutter/material.dart';
import 'package:flutter_application_1/citizen/Archive_complaints/model/complaints_model.dart';
import 'package:flutter_application_1/core/utils/static.dart';

class ArchiveComplaintsBlock extends StatelessWidget {
  final Complaints complaints;
  const ArchiveComplaintsBlock({super.key, required this.complaints});

  @override
  Widget build(BuildContext context) {
    double padding = 18;
    double horizontal = Static.getwidth(context, 16);
    double vertical = Static.getheight(context, 10);
    return Container(
      padding: EdgeInsets.all(Static.getwidth(context, padding)),
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Static.getwidth(context, 18)),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "شكوى رقم: ${complaints.id}",
            style: TextStyle(
              fontFamily: Static.cairo,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: Static.getheight(context, 10)),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                complaints.governmentAgencyName!,
                style: TextStyle(
                  fontFamily: Static.cairo,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: Static.getwidth(context, 10)),
              Icon(
                Icons.account_balance,
                size: Static.getheight(context, 20),
                color: Static.basiccolor,
              ),
            ],
          ),

          SizedBox(height: Static.getheight(context, 6)),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "تاريخ التقديم: ${complaints.date}",
                style: TextStyle(
                  fontFamily: Static.cairo,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: Static.getwidth(context, 6)),
              Icon(
                Icons.calendar_today,
                size: Static.getwidth(context, 18),
                color: Colors.black45,
              ),
            ],
          ),

          SizedBox(height: Static.getheight(context, 14)),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontal,
                vertical: vertical,
              ),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.15),
                borderRadius: BorderRadius.circular(
                  Static.getwidth(context, 16),
                ),
                border: Border.all(color: Colors.orange),
              ),
              child: Text(
                complaints.statusName!,
                style: TextStyle(
                  fontFamily: Static.cairo,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ),
          ),

          SizedBox(height: Static.getheight(context, 12)),

          Text(
            complaints.description!,
            style: TextStyle(
              fontFamily: Static.cairo,
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
            textAlign: TextAlign.end,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: Static.getheight(context, 12)),

          if (complaints.notes != null && complaints.notes!.trim().isNotEmpty)
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
                          complaints.notes!,
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

                  Icon(Icons.note_alt, color: Static.basiccolor, size: 20),
                ],
              ),
            ),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/complaint.png",
              height: Static.getheight(context, 200),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
