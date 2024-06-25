import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:internet_feature_apps/theme/theme_helper.dart';
import 'package:internet_feature_apps/widgets/expandable_card_widget.dart';
import 'package:internet_feature_apps/transaction_history.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Item> items = [
    Item(image: 'assets/images/f1.png', name: 'Rp.450.000', price: 450000),
    Item(image: 'assets/images/f2.png', name: 'Rp.250.000', price: 250000),
  ];
  final List<Item> checkedItems = [];

  bool _isAllChecked = false;

  void _toggleCheck(Item item) {
    setState(() {
      if (checkedItems.contains(item)) {
        checkedItems.remove(item);
      } else {
        checkedItems.add(item);
      }
      _isAllChecked = checkedItems.length == items.length;
    });
  }

  void _checkAll(bool? value) {
    setState(() {
      _isAllChecked = value ?? false;
      checkedItems.clear();
      if (_isAllChecked) {
        checkedItems.addAll(items);
      }
    });
  }

  double _calculateTotal() {
    return checkedItems.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title:
            const Text('Shopping Cart', style: TextStyle(color: Colors.black)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 8),
                          decoration: BoxDecoration(
                            color: yellowColor1,
                            border:
                                Border.all(color: yellowAmberA200, width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(height: 10),
                              Image.asset('assets/images/info_out.png'),
                              const SizedBox(width: 12),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Perlu diketahui, proses verifikasi transaksi dapat\nmemakan waktu hingga",
                                        style: bodySmall,
                                      ),
                                      TextSpan(
                                        text: " 1x24 jam.",
                                        style: labelLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Choose All',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Checkbox(
                              activeColor: Colors.deepPurple,
                              value: _isAllChecked,
                              onChanged: _checkAll,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ExpandableCardWidget(
                            price: item.price,
                            dueDate: 'Due date on 16 Feb 2024',
                            provider: 'Nethome',
                            idPelanggan: '1123645718921',
                            paketLayanan: 'Nethome 100 Mbps',
                            isChecked: checkedItems.contains(item),
                            imagePath: item.image,
                            onCheckboxChanged: (bool? value) {
                              _toggleCheck(item);
                            },
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/transaction_history');
                        },
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Transaction History',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/ic_bill.png'),
                          const SizedBox(width: 20),
                          const Text('Total Payment',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(formatCurrency.format(_calculateTotal()),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE12029),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        // Logic for payment
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('PAY NOW',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String image;
  final String name;
  final double price;

  Item({required this.image, required this.name, required this.price});
}
