import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Common/Config/Theme/app_colors.dart';

class SupplierInfo {
  final TextEditingController invoiceNo = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController supplier = TextEditingController();
  final TextEditingController supplierBin = TextEditingController();
  final TextEditingController amountSupplies = TextEditingController();
  final TextEditingController amountVat = TextEditingController();
}

class ClaimFormPage extends StatefulWidget {
  const ClaimFormPage({super.key});

  @override
  State<ClaimFormPage> createState() => _ClaimFormPageState();
}

class _ClaimFormPageState extends State<ClaimFormPage> {
  final List<SupplierInfo> supplierInfos = [SupplierInfo()];
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController applicantNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController binController = TextEditingController();
  final TextEditingController vatAmountController = TextEditingController();
  String? selectedOrganization;

  void _addSupplierInfo() {
    setState(() {
      supplierInfos.add(SupplierInfo());
    });
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claim Submission'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Organization*',
                labelStyle: const TextStyle(color: AppColors.textSecondary),
                suffix: const Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
              value: selectedOrganization,
              items: ['Org 1', 'Org 2', 'Org 3']
                  .map((org) => DropdownMenuItem(value: org, child: Text(org)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedOrganization = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: applicantNameController,
              decoration: InputDecoration(
                labelText: 'Name of Applicant*',
                labelStyle: const TextStyle(color: AppColors.textSecondary),
                suffix: const Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: designationController,
              decoration: InputDecoration(
                labelText: 'Designation*',
                labelStyle: const TextStyle(color: AppColors.textSecondary),
                suffix: const Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: binController,
              decoration: const InputDecoration(
                labelText: 'BIN No. (If Any)',
                labelStyle: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: vatAmountController,
              decoration: InputDecoration(
                labelText: 'Actual Amount of VAT*',
                labelStyle: const TextStyle(color: AppColors.textSecondary),
                suffix: const Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Supplier Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: AppColors.accent),
                  onPressed: _addSupplierInfo,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: supplierInfos.length,
              itemBuilder: (context, index) {
                final supplier = supplierInfos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: supplier.invoiceNo,
                          decoration: InputDecoration(
                            labelText: 'Invoice/Chalan No.*',
                            labelStyle: const TextStyle(color: AppColors.textSecondary),
                            suffix: const Text(
                              '*',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: supplier.date,
                          decoration: InputDecoration(
                            labelText: 'Invoice/Chalan Date*',
                            labelStyle: const TextStyle(color: AppColors.textSecondary),
                            suffix: const Text(
                              '*',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                          readOnly: true,
                          onTap: () => _selectDate(context, supplier.date),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: supplier.supplier,
                          decoration: InputDecoration(
                            labelText: 'Supplier*',
                            labelStyle: const TextStyle(color: AppColors.textSecondary),
                            suffix: const Text(
                              '*',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: supplier.supplierBin,
                          decoration: InputDecoration(
                            labelText: 'Supplier BIN*',
                            labelStyle: const TextStyle(color: AppColors.textSecondary),
                            suffix: const Text(
                              '*',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: supplier.amountSupplies,
                          decoration: InputDecoration(
                            labelText: 'Amount of Supplies*',
                            labelStyle: const TextStyle(color: AppColors.textSecondary),
                            suffix: const Text(
                              '*',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: supplier.amountVat,
                          decoration: InputDecoration(
                            labelText: 'Amount of VAT/TAX*',
                            labelStyle: const TextStyle(color: AppColors.textSecondary),
                            suffix: const Text(
                              '*',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Attach File'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),
            Text(
              'Total Amount of VAT/TAX: 0.00 TK',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}