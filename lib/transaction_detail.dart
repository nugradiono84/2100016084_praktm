import 'package:flutter/material.dart';
import 'package:internet_feature_apps/theme/theme_helper.dart';

class TransactionDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Transaction Details',
            style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Image.asset('assets/images/pembayaran.png'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildDetailRow('Provider', 'Nethome'),
                  const SizedBox(height: 20),
                  _buildDetailRow('ID Pelanggan', '1123645718921'),
                  const SizedBox(height: 20),
                  _buildDetailRow('Paket Layanan', 'Nethome 100 Mbps'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildDetailRow('No. Transaksi', 'BC444724669887648110'),
                  const SizedBox(height: 16),
                  const Divider(height: 0, color: Colors.grey),
                  const SizedBox(height: 20),
                  _buildDetailRow('Waktu Transaksi', '15 Feb 2024 10:32'),
                  const SizedBox(height: 16),
                  const Divider(height: 0, color: Colors.grey),
                  const SizedBox(height: 20),
                  _buildDetailRow('Jumlah Tagihan', 'Rp450.000'),
                  const SizedBox(height: 16),
                  const Divider(height: 0, color: Colors.grey),
                  const SizedBox(height: 20),
                  _buildDetailRow('Biaya Layanan', 'Gratis'),
                  const SizedBox(height: 16),
                  const Divider(height: 0, color: Colors.grey),
                  const SizedBox(height: 20),
                  _buildDetailRow('Total Pembayaran', 'Rp450.000'),
                  const SizedBox(height: 20),
                ],
              ),
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
        Text(label, style: labelLarge),
        Text(value, style: labelLarge),
      ],
    );
  }
}
