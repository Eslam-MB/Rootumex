import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootumex/widgets/custom_container.dart';

class TransferItemDetails extends ConsumerStatefulWidget {
  const TransferItemDetails(this.docNo, {super.key});
  final int docNo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransferItemDetailsState();
}

class _TransferItemDetailsState extends ConsumerState<TransferItemDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const CustomContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item name:   جعب 3 PVC",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Purchase order quantity",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "350",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Received quantity",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Type your quantity",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
                  ),
                  SizedBox(height: 30),
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
                    onPressed: () {},
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
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
