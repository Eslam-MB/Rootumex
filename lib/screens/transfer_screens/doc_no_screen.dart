import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootumex/models/order_no_model.dart';
import 'package:rootumex/screens/transfer_screens/transfer_item_details.dart';
import 'package:rootumex/widgets/mainwrapper_widget.dart';

class DocNoScreen extends ConsumerStatefulWidget {
  const DocNoScreen(this.docNo, {super.key});
  final int docNo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocNoScreenState();
}

class _DocNoScreenState extends ConsumerState<DocNoScreen> {
  List<CustomEntry> transferDocNo = [
    CustomEntry(12345, 3, "جعب 3 PVC"),
    CustomEntry(67890, 200, "محول 6 × 4 PVC"),
    CustomEntry(3232445, 120, " 6 PVC"),
    CustomEntry(33323445, 30, "جعب  4 PVC"),
    CustomEntry(232343555, 40, "لافته PVC"),
    CustomEntry(2322424, 40, "محول 6 × 4 PVC"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transfer",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff143D60)),
          ),
          const SizedBox(height: 5),
          TextField(
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                hintText: "Scan",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    'assets/images/barcode_logo.svg',
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(maxHeight: 40)),
          ),
          const SizedBox(height: 10),
          Text(
            "DOC NO. ${widget.docNo}",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                columns: const [
                  DataColumn(
                      label: Text("Item code",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Color(0xff143D60)))),
                  DataColumn(
                      label: Text("Qty",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Color(0xff143D60)))),
                  DataColumn(
                      label: Text("Item name",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Color(0xff143D60)))),
                ],
                rows: transferDocNo
                    .map((e) => DataRow(cells: [
                          DataCell(onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mainwrapper(
                                      child: TransferItemDetails(e.id)),
                                ));
                          },
                              Text(e.id.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black))),
                          DataCell(Text(e.quantity.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black))),
                          DataCell(Text(e.company,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black))),
                        ]))
                    .toList()),
          )
        ],
      ),
    );
  }
}
