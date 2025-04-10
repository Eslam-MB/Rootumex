import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootumex/widgets/custom_container.dart';

class CompletedDetails extends ConsumerStatefulWidget {
  const CompletedDetails(this.orderNo, {super.key});
  final int orderNo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompletedDetailsState();
}

class _CompletedDetailsState extends ConsumerState<CompletedDetails> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          CustomContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Item name:   جعب 3 PVC",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Purchase order quantity",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "500",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Received quantity",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    enabled: isEditing ? true : false,
                    initialValue: "450",
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        hintText: "Type your quantity",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    child: Text(
                      isEditing ? "Save" : "Edit",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
