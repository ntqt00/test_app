// lib/presentation/home/widgets/khachhang_list.dart
import 'package:flutter/material.dart';
import 'package:mobile_qlcv/domain/entities/khachhang_entity.dart';

class KhachHangList extends StatelessWidget {
  final List<KhachHangEntity> customers;

  const KhachHangList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return ListTile(
          title: Text(customer.tenKhachHang as String),
          subtitle: Text(customer.khachHangId.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Implement navigation to customer details page
            },
          ),
        );
      },
    );
  }
}
