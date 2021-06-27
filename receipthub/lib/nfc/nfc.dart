import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';

Future<bool> isAvailable() async {
  return Future<bool>(NfcManager.instance.isAvailable);
}

// class NFCReader extends StatefulWidget {
//   NFCReader() {}
//
//   @override
//   State<StatefulWidget> createState() {
//     return _NFCReaderState();
//   }
// }

class TagReadModel with ChangeNotifier {
  NfcTag? tag;
  bool loading = true;
  Map<String, dynamic>? additionalData;

  Future<String?> handleTag(NfcTag tag) async {
    this.tag = tag;
    additionalData = {};
    this.loading = false;
    notifyListeners();
    return '[Tag - Read] is completed.';
  }
}

class TagReadPage extends StatelessWidget {
  TagReadPage._();
  bool loading = false;
  static Widget create() => ChangeNotifierProvider<TagReadModel>(
        create: (context) => TagReadModel(),
        child: TagReadPage._(),
      );

  Widget _buildTagWidget(BuildContext context, NfcTag tag) {
    var res = "Loading...";
    Object? tech;

    tech = Ndef.from(tag);
    if (tech is Ndef) {
      final cachedMessage = tech.cachedMessage;
      if (cachedMessage != null) {
        final record = cachedMessage.records[0];
        final payload = record.payload;
        res = utf8.decode(payload);
      }
    }
    if (res == "Loading...") {
      res = "No Data";
    }
    return Text(res);
  }

  void onStart(context) {
    print("Searching");
    loading = true;
    NfcManager.instance.startSession(
        onDiscovered:
            Provider.of<TagReadModel>(context, listen: false).handleTag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tag - Read'),
        ),
        body: Consumer<TagReadModel>(
            builder: (context, model, _) =>
                ListView(padding: EdgeInsets.all(2), children: [
                  Button(
                    callback: () => onStart(context),
                    text: 'Read E-Receipt',
                  ),
                  if (model.tag != null) _buildTagWidget(context, model.tag!),
                  if (loading)
                    Expanded(
                        child: Container(
                            child: CircularProgressIndicator(),
                            width: 100,
                            height: 100))
                ])));
  }
}

// class _NFCReaderState extends State<NFCReader> {
//   _NFCReaderState() {}
//   Future<TagReadModel>? tag = null;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   var futureBuilder = ;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<TagReadModel>(
//             future: tag,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.response);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//
//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ));
//   }
// }
