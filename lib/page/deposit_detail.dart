import 'package:bin_bank_app/utility/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DepositDetails extends StatefulWidget {
  DepositDetails({super.key, this.transactionItem});

  var transactionItem;

  @override
  State<DepositDetails> createState() => _DepositDetailsState();
}

class _DepositDetailsState extends State<DepositDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
        drawer: const MyDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(''),
                  RichText(
                      text: TextSpan(
                          text: 'Date: ',
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: DateFormat("MMM dd, y").format(
                                    widget.transactionItem.fields.date),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: 'Amount(KG): ',
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${widget.transactionItem.fields.amountKg}/10',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: 'Status: ',
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: widget.transactionItem.fields.isFinished
                                    ? "Finished"
                                    : "Not Finished",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: 'Branch Name: ',
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${widget.transactionItem.fields.branchName}',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ))
                          ])),
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back"),
                  ),
                ])));
  }
}
