import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rootumex/widgets/custom_container.dart';

class ItemsScreen extends ConsumerStatefulWidget {
  const ItemsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends ConsumerState<ItemsScreen> {
  final TextEditingController _itemScanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Items",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xff143D60)),
        ),
        const SizedBox(height: 5),
        TextField(
          keyboardType: TextInputType.number,
          controller: _itemScanController,
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
          onSubmitted: (value) {
            setState(() {});
          },
        ),
        const SizedBox(height: 16),
        const Text(
          "Item card",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        _itemScanController.text.isNotEmpty
            ? const CustomContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: PVC 3 جعب",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                      Text("Bar-code: 14435556644",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                      Text("UOM: Box",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                      Text("Total stock: 500",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                      Text("Project name: General",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                      Text("Location: SK02 ZN01 RK03 R04 C02R04",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            : CustomContainer(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 34, vertical: 80),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/images/scanner-keyboard.svg'),
                        const SizedBox(height: 10),
                        const Text(
                          "Scan a bar-code to view information",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        const SizedBox(height: 10),
        _itemScanController.text.isEmpty
            ? const SizedBox()
            : Row(
                children: [
                  Expanded(
                      child: FilledButton(
                          onPressed: () {},
                          child: const Text(
                            "Print item card",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ))),
                ],
              ),
      ],
    ));
  }
}
