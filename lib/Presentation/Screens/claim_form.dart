import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Common/Config/Theme/app_colors.dart';
import '../../Core/Widgets/custom_textfield.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Organization',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Organization',
                labelStyle: TextStyle(color: AppColors.textSecondary),
                suffix: Text(
                  '*',
                  style: TextStyle(color: AppColors.error),
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textSecondary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
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
            CustomTextField(
              labelText: 'Name of Applicant',
              controller: applicantNameController,
              isRequired: true,
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              labelText: 'Designation',
              controller: designationController,
              isRequired: true,
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              labelText: 'BIN No. (If Any)',
              controller: binController,
              isRequired: false,
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              labelText: 'Actual Amount of VAT',
              controller: vatAmountController,
              isRequired: true,
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
                        CustomTextField(
                          labelText: 'Invoice/Chalan No.',
                          controller: supplier.invoiceNo,
                          isRequired: true,
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Invoice/Chalan Date',
                          controller: supplier.date,
                          isRequired: true,
                          readOnly: true,
                          onTap: () => _selectDate(context, supplier.date),
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Supplier',
                          controller: supplier.supplier,
                          isRequired: true,
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Supplier BIN',
                          controller: supplier.supplierBin,
                          isRequired: true,
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Amount of Supplies',
                          controller: supplier.amountSupplies,
                          isRequired: true,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Amount of VAT/TAX',
                          controller: supplier.amountVat,
                          isRequired: true,
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