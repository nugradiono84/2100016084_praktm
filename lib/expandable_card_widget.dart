import 'package:flutter/material.dart';

class ExpandableCardWidget extends StatefulWidget {
  final double price;
  final String dueDate;
  final String provider;
  final String idPelanggan;
  final String paketLayanan;
  final bool isChecked;
  final String imagePath;
  final ValueChanged<bool?> onCheckboxChanged;

  ExpandableCardWidget({
    required this.price,
    required this.dueDate,
    required this.provider,
    required this.idPelanggan,
    required this.paketLayanan,
    required this.isChecked,
    required this.imagePath,
    required this.onCheckboxChanged,
  });

  @override
  _ExpandableCardWidgetState createState() => _ExpandableCardWidgetState();
}

class _ExpandableCardWidgetState extends State<ExpandableCardWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(widget.imagePath),
            title: Text(widget.provider),
            subtitle: Text(widget.dueDate),
            trailing: Checkbox(
              value: widget.isChecked,
              onChanged: widget.onCheckboxChanged,
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _buildDetailRow('ID Pelanggan', widget.idPelanggan),
                  const SizedBox(height: 8),
                  _buildDetailRow('Paket Layanan', widget.paketLayanan),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                      'Price', 'Rp${widget.price.toStringAsFixed(0)}'),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}
