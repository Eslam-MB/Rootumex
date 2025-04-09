import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rootumex/widgets/categories_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            "ROOTUMEX",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "Inter",
                fontWeight: FontWeight.w900,
                color: Color(0xff143D60)),
          ),
          centerTitle: true,
        ),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Main Categories",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    image: "assets/images/receive.svg",
                    title: "Receive",
                  ),
                  CategoriesCard(
                    image: "assets/images/transfer.svg",
                    title: "Transfer",
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    image: "assets/images/zones.svg",
                    title: "Zones",
                  ),
                  CategoriesCard(
                    image: "assets/images/return.svg",
                    title: "Return",
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    image: "assets/images/waste.svg",
                    title: "Waste",
                  ),
                  CategoriesCard(
                    image: "assets/images/items.svg",
                    title: "Items",
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    image: "assets/images/stock.svg",
                    title: "Stock count",
                  ),
                  CategoriesCard(
                    image: "assets/images/barcode.svg",
                    title: "Bar-code printer",
                  ),
                ],
              ),
              SizedBox(height: 65),
            ],
          ),
        ),
      ),
      bottomSheet: const ExpandableBottomSheet(),
    );
  }
}

class ExpandableBottomSheet extends StatefulWidget {
  const ExpandableBottomSheet({super.key});

  @override
  State<ExpandableBottomSheet> createState() => _ExpandableBottomSheetState();
}

class _ExpandableBottomSheetState extends State<ExpandableBottomSheet> {
  bool isExpanded = false;

  void toggleSheet() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSheet,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        height: isExpanded ? 150 : 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SvgPicture.asset(
                  isExpanded
                      ? "assets/images/arrows-to-line.svg"
                      : "assets/images/arrows-from-line.svg",
                  height: 20,
                )
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 8),
              const Text(
                "56789012",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  context.go("/login");
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                child: const Text("Logout"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
