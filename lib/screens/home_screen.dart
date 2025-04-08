import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rootumex/widgets/categories_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Account",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              TextButton(
                  onPressed: () => context.go("/login"),
                  child: const Text("Log out"))
            ],
          ),
        ),
      ),
    );
  }
}
