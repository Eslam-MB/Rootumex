import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReceiveScreen extends ConsumerStatefulWidget {
  const ReceiveScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends ConsumerState<ReceiveScreen> {
  List<MapEntry<int, String>> receiveList = [
    const MapEntry(46576356, "Al-yanabea company"),
    const MapEntry(5555455, "Senwan group"),
    const MapEntry(3344445, "Al-yanabea company"),
    const MapEntry(33343433, "Al-yanabea company"),
    const MapEntry(44455534, "Senwan group"),
    const MapEntry(34355534, "Al-yanabea company"),
    const MapEntry(33434566, "Senwan group"),
    const MapEntry(33434566, "Senwan group"),
    const MapEntry(33434566, "Senwan group"),
    const MapEntry(33434566, "Senwan group"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const Text(
            "Receive",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff143D60)),
          ),
          const SizedBox(height: 5),
          const TextField(
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff143D60),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                      label: Text("Order NO.",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Color(0xff143D60)))),
                  DataColumn(
                      label: Text("Vendor",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Color(0xff143D60)))),
                ],
                rows: receiveList
                    .map((e) => DataRow(cells: [
                          DataCell(Text("${e.key.toString()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.black))),
                          DataCell(Text("${e.value}",
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
