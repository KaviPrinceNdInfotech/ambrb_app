import 'dart:io';

import 'package:ambrd_appss/modules/invoice_views/api/pdf_api.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

//import 'package:roshini/modules/invoice_views/api/pdf_api.dart';

import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';
import '../utils.dart';

class PdfInvoiceApi {
  static Future<File> generate(
    Invoice invoice,
  ) async {
    final pdf = Document();
    final font =
        await rootBundle.load("lib/assets/fonts/Roboto/Roboto-Bold.ttf");
    final ttf = Font.ttf(font);
    final iconImage =
        (await rootBundle.load('lib/assets/images/JK_ROSHINI_png.png'))
            .buffer
            .asUint8List();

    pdf.addPage(pw.MultiPage(
      build: (context) => [
        buildHeader(invoice, iconImage, ttf),
        /* SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(invoice),*/
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice),
      ],
      footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice, iconImage, ttf) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 1 * PdfPageFormat.cm),
          Row(children: [
            Image(
                MemoryImage(
                  iconImage,
                ),
                height: 32,
                width: 82,
                fit: BoxFit.cover),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildVendorAddress(invoice.vendor),
                    //SizedBox(height: 1 * PdfPageFormat.cm),
                    Text(
                      'Tax Invoice/Bill of Supply',
                      style: TextStyle(
                        fontSize: 15.0,
                        font: ttf,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ]),
              buildSupplierAddress(invoice.supplier),
            ],
          ),
          //  SizedBox(height: 1 * PdfPageFormat.cm),
          Divider(),
          //SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice.customer),
              buildInvoiceInfo(invoice.info),
            ],
          ),
          // SizedBox(height: 1 * PdfPageFormat.cm),
        ],
      );

  static Widget buildCustomerAddress(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.order, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.invoiceNumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text(customer.paymentMethod,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(customer.totalItems,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info) {
    // final paymentTerms = '${info.orderDate.difference(info.invoiceDate).inDays} days';
    final titles = <String>[
      'Order Date: ',
      'Invoice Date: ',
      'OrderStatus: ',
      'PaymentStatus: ',
    ];
    final data = <String>[
      Utils.formatDate(info.invoiceDate),
      // paymentTerms,
      Utils.formatDate(info.orderDate),
      info.orderStatus,
      info.paymentStatus,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];
        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  //////vendor
  static Widget buildVendorAddress(Vendor vendor) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("INVOICE FROM", style: TextStyle(fontSize: 18)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(vendor.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(vendor.email,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(vendor.address,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          // Text("Phone: ${vendor.mobile}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          //Text("Pin: ${vendor.pin}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
        ],
      );
  //
  static Widget buildSupplierAddress(Supplier supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("INVOICE TO", style: TextStyle(fontSize: 18)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.email,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.address,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.mobile,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.pin,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        ],
      );

  /* static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INVOICE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.info.description),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );*/

  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      'Description',
      // 'Date',
      'Quantity',
      'Unit Price',
      // 'VAT',
      'Total'
    ];
    final data = invoice.items.map((item) {
      final total = item.unitPrice * item.quantity * (1 + item.vat);

      return [
        item.description,
        // Utils.formatDate(item.date),
        '${item.quantity}',
        '\$ ${item.unitPrice}',
        // '${item.vat} %',
        '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
        5: Alignment.center,
      },
    );
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items
        .map((item) => item.unitPrice * item.quantity)
        .reduce((item1, item2) => item1 + item2);
    final vatPercent = invoice.items.first.vat;
    final vat = netTotal * vatPercent;
    final total = netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: Utils.formatPrice(netTotal),
                  unite: true,
                ),
                // buildText(
                //   title: 'Vat ${vatPercent * 100} %',
                //   value: Utils.formatPrice(vat),
                //   unite: true,
                // ),
                Divider(),
                buildText(
                  title: 'Total amount due',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Return Policy: ', value: invoice.supplier.returnPolicy),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Regd. office: ', value: invoice.supplier.office),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return pw.RichText(
        text: pw.TextSpan(children: [
      pw.TextSpan(text: title, style: style),
      pw.TextSpan(
        text: value,
      ),
    ]));
    /*  Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );*/
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: style),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
