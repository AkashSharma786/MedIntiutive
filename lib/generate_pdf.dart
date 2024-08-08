import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class GenerateInvoice {
  List<int> quatities = [];

  List<Map<String, Object?>> itemList = [];
  double discount= 0;
  double total = 0;

  GenerateInvoice(
      {required this.itemList, required this.discount, required this.quatities});

   Future<void> generatePdf() async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(
        File('assets/images/cropped_logo.png').readAsBytesSync());

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(0),
        build: (pw.Context context) {
          final pageWidth = PdfPageFormat.a4.width;
          final pageHeight = PdfPageFormat.a4.height;
          final keyList = itemList[0].keys.toList();
          int i = 0;

          for( Map<String, Object?> item in itemList){
            total += double.parse((item[keyList[6]]).toString())*quatities[i] ;

          }
          
          double gst = total*0.18;

          

          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Container(
                height: pageHeight * 0.03,
                color: PdfColors.purple,
              ),


              pw.Container(
                height: pageHeight*0.94,
                child: pw.Row(children: [
                pw.SizedBox(width: pageWidth * 0.02),
                pw.Column(children: [
                  pw.Container(
                    height: pageHeight * 0.1,
                    width: pageWidth * 0.96,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Invoice',
                            style: pw.TextStyle(
                                fontSize: 35, fontWeight: pw.FontWeight.bold)),
                        pw.Image(
                          image,
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  pw.Container(
                    height: pageHeight * 0.12,
                    width: pageWidth * 0.96,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text('Company Name:',
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text('Address:',
                                    style: pw.TextStyle(fontSize: 16)),
                                pw.Text('Phone:',
                                    style: pw.TextStyle(fontSize: 16)),
                                pw.Text('Email:',
                                    style: pw.TextStyle(fontSize: 16))
                              ]),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.end,
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Text('Date:',
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text('Invoice No:',
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold)),
                                
                              ]),
                        ]),

                  ),
                  pw.Container(
                
                    height: pageHeight * 0.70,
                    width: pageWidth * 0.96,
               
                    child: pw.Column(children: [
                      pw.SizedBox(height: pageHeight * 0.02),
                      pw.Table(
                        border: pw.TableBorder.all(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        tableWidth: pw.TableWidth.max,
                        columnWidths: {
                          0: pw.FlexColumnWidth(1),
                          1: pw.FlexColumnWidth(4),
                          2: pw.FlexColumnWidth(2),
                          3: pw.FlexColumnWidth(1),
                          4: pw.FlexColumnWidth(2),
                        },
                        children: [
                          pw.TableRow(
                            decoration: pw.BoxDecoration(color: PdfColors.purple100),
                            children: [
                              pw.Container(
                                height:pageHeight*0.05, // Set height for the header row
                                child: pw.Center(child: pw.Text('Serial No')),
                              ),
                              pw.Container(
                                height:pageHeight*0.05, // Set height for the header row
                                child: pw.Center(child: pw.Text('Particulars')),
                              ),
                              pw.Container(
                                height:pageHeight*0.05, // Set height for the header row
                                child: pw.Center(child: pw.Text('Price')),
                              ),
                            
                              pw.Container(
                                height:pageHeight*0.05, // Set height for the header row
                                child: pw.Center(child: pw.Text('Quantitiy')),
                              ),
                              pw.Container(
                                height:pageHeight*0.05, // Set height for the header row
                                child: pw.Center(child: pw.Text('Total')),
                              ),
                            ]
                          ),
                          
                    
                          
                           for (int i = 0; i < itemList.length; i++)
                            pw.TableRow(
                              children: [
                                pw.Container(
                                  height:pageHeight*0.04, // Set height for the header row
                                  child: pw.Center(child: pw.Text(i.toString())),
                                ),
                                pw.Container(
                                  height:pageHeight*0.04, // Set height for the header row
                                  child: pw.Center(child: pw.Text((itemList[i][keyList[1]]).toString())),
                                ),
                                pw.Container(
                                  height:pageHeight*0.04, // Set height for the header row
                                  child: pw.Center(child: pw.Text((itemList[i][keyList[6]]).toString())),
                                ),
                                pw.Container(
                                  height:pageHeight*0.04, // Set height for the header row
                                  child: pw.Center(child: pw.Text(quatities[i].toString())),
                                ),
                                pw.Container(
                                  height:pageHeight*0.04, // Set height for the header row
                                  child: pw.Center(child: pw.Text((double.parse(itemList[i][keyList[6]].toString()) * quatities[i]  ).toString())),
                                ),
                              ],
                            ),
      
                    
                          // Add more rows as needed
                        ],

                        


                      ),


                      pw.Table(
                        border: pw.TableBorder.all(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        tableWidth: pw.TableWidth.max,

                        columnWidths: {
                          0 : pw.FlexColumnWidth(7),
                          1 : pw.FlexColumnWidth(1),
                          2 : pw.FlexColumnWidth(2),
                   
                        },
                        children: [
                         pw.TableRow(
                          children: [
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child:  pw.Text('GST'), )
                            ),
                          
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text('18%')),
                            ),

                          
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text("$gst")),
                            ),
                          ],
                        ),

                           pw.TableRow(
                          children: [
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text('Discount')),
                            ),
                          
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text('$discount %')),
                            ),

                          
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text('${total*(discount/100)}')),
                            ),
                          ],
                        ),
                        
                        


                      ] ),
                      
                   





                      pw.Table(
                        border: pw.TableBorder.all(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        tableWidth: pw.TableWidth.max,

                        columnWidths: {
                          0 : pw.FlexColumnWidth(4),
                          1 : pw.FlexColumnWidth(1)
                        },
                        children: [
                        pw.TableRow(
                          children: [
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text('Total' , style: pw.TextStyle(fontSize: 15, fontWeight:  pw.FontWeight.bold))),
                            ),
                          
                            pw.Container(
                              height: pageHeight * 0.05,
                              child: pw.Center(child: pw.Text('$total' , style: pw.TextStyle(fontSize: 15 , fontWeight:  pw.FontWeight.bold))),
                            ),
                          ],
                        ),

                      ] )


                    ]),
                  ),

           


                ]),
                pw.SizedBox(width: pageWidth * 0.02),
              ]),
              
                


              ),
       
              pw.Container(
                height: pageHeight * 0.03,
                width: pageWidth,
                color: PdfColors.purple,
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF file
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
