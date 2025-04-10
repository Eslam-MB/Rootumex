import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootumex/models/order_no_model.dart';
import 'package:rootumex/screens/receive_screens/item_details_screen.dart';
import 'package:rootumex/widgets/mainwrapper_widget.dart';

class OrderNoScreen extends ConsumerStatefulWidget {
  const OrderNoScreen(this.orderNo, {super.key});
  final int orderNo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderNoScreenState();
}

class _OrderNoScreenState extends ConsumerState<OrderNoScreen> {
  List<CustomEntry> receiveOrderNo = [
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
            "Receive",
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
            "Order NO. ${widget.orderNo}",
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
                rows: receiveOrderNo
                    .map((e) => DataRow(cells: [
                          DataCell(GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Mainwrapper(
                                        child: ItemDetailsScreen(e.id)),
                                  ));
                            },
                            child: Text(e.id.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.black)),
                          )),
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
