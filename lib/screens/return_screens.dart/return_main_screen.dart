import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rootumex/screens/return_screens.dart/return_completed_doc.dart';
import 'package:rootumex/screens/return_screens.dart/return_doc_no_screen.dart';
import 'package:rootumex/widgets/mainwrapper_widget.dart';

class ReturnMainScreen extends ConsumerStatefulWidget {
  const ReturnMainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReturnMainScreenState();
}

class _ReturnMainScreenState extends ConsumerState<ReturnMainScreen> {
  List<MapEntry<int, String>> returnList = [
    const MapEntry(46576356, "Al-yanabea company"),
    const MapEntry(5555455, "Senwan group"),
    const MapEntry(33434566, "Senwan group"),
    const MapEntry(3344445, "Al-yanabea company"),
    const MapEntry(33343433, "Al-yanabea company"),
    const MapEntry(44455534, "Senwan group"),
    const MapEntry(33434566, "Senwan group 2"),
    const MapEntry(34355534, "Al-yanabea company"),
    const MapEntry(33434566, "Senwan group 3"),
    const MapEntry(33434566, "Senwan group"),
  ];

  List<MapEntry<int, String>> returnListCompleted = [
    const MapEntry(46576356, "Al-yanabea company"),
    const MapEntry(3344445, "Al-yanabea company"),
    const MapEntry(5555455, "Senwan group"),
  ];

  bool isNewPressed = true;
  bool isCompletedPressed = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Return",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xff143D60)),
          ),
          const SizedBox(height: 5),
          const TextField(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff143D60),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: isNewPressed
                        ? const Color(0xffE0E5EA)
                        : Colors.transparent,
                  ),
                  onPressed: () {
                    if (isNewPressed == false) {
                      setState(() {
                        isNewPressed = true;
                        isCompletedPressed = false;
                      });
                    }
                  },
                  child: Text(
                    "New",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isNewPressed
                            ? const Color(0xff143D60)
                            : const Color(0xff717172)),
                  ),
                ),
              ),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: isCompletedPressed
                        ? const Color(0xffE0E5EA)
                        : Colors.transparent,
                  ),
                  onPressed: () {
                    if (isCompletedPressed == false) {
                      setState(() {
                        isNewPressed = false;
                        isCompletedPressed = true;
                      });
                    }
                  },
                  child: Text(
                    "Completed",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isCompletedPressed
                            ? const Color(0xff143D60)
                            : const Color(0xff717172)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          isNewPressed
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      columns: const [
                        DataColumn(
                            label: Text("DOC NO.",
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
                      rows: returnList
                          .map((e) => DataRow(cells: [
                                DataCell(onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Mainwrapper(
                                            child: ReturnDocNoScreen(e.key)),
                                      ));
                                },
                                    Text(e.key.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black))),
                                DataCell(Text(e.value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black))),
                              ]))
                          .toList()),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      columns: const [
                        DataColumn(
                            label: Text("DOC NO.",
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
                      rows: returnListCompleted
                          .map((e) => DataRow(cells: [
                                DataCell(onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Mainwrapper(
                                            child: ReturnCompletedDoc(e.key)),
                                      ));
                                },
                                    Text(e.key.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black))),
                                DataCell(Text(e.value,
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
