// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter_meta_appads_sdk/flutter_meta_appads_sdk.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final _flutterMetaAppadsSdkPlugin = FlutterMetaAppAdsSdk();
  String? fbAnonId;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.initSdk(enableLogging: true),
            ),
            child: const Text("Init SDK"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: const Text("Get FB AnonId"),
            onPressed: () async {
              var anonId = await _flutterMetaAppadsSdkPlugin.getFbAnonId();
              setState(() {
                fbAnonId = anonId;
              });
            },
          ),
          Text("FB ANON ID: ${fbAnonId ?? "Not retrieved AnonId"}"),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.logEvents(
                FBLogEventCommand(
                  eventName: "test_event",
                  eventParameters: {
                    "my_parameter": "1234",
                  },
                ),
              ),
            ),
            child: const Text("Log Event"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.logStandardEvent(
                FBLogStandardEventCommand(
                  event: FBStandardEvent.contact,
                  parameters: {
                    FBStandardParameter.parameterNameSuccess: "1",
                  },
                ),
              ),
            ),
            child: const Text("Log Standard Event"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.logPurchase(
                FBLogPurchaseCommand(
                  amount: 1,
                  currency: "USB",
                  eventParameter: {
                    "my_parameter": "1234",
                  },
                ),
              ),
            ),
            child: const Text("Log Purchase"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setUserData(
                FBSetUserDataCommand(
                  type: FBUserDataType.country,
                  value:
                      "6959097001d10501ac7d54c0bdb8db61420f658f2922cc26e46d536119a31126",
                ),
              ),
            ),
            child: const Text("Set UserData"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setAdvertiserTrackingEnabled(
                isEnabled: true,
              ),
            ),
            child: const Text("Set Advertiser Tracking Enabled - True"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setAdvertiserTrackingEnabled(
                isEnabled: false,
              ),
            ),
            child: const Text("Set Advertiser Tracking Enabled - False"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setAdvertiserIDCollectionEnabled(
                isEnabled: true,
              ),
            ),
            child: const Text("Set Advertiser ID Collection Enabled - True"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setAdvertiserIDCollectionEnabled(
                isEnabled: false,
              ),
            ),
            child: const Text("Set Advertiser ID Collection Enabled - False"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setDataProcessingOptions(
                  FBSetDataProcessingOptionsCommand(modes: [])),
            ),
            child: const Text("setDataProcessingOptions - empty modes"),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () => unawaited(
              _flutterMetaAppadsSdkPlugin.setDataProcessingOptions(
                FBSetDataProcessingOptionsCommand(
                  modes: ["LDU"],
                  country: 0,
                  state: 0,
                ),
              ),
            ),
            child: const Text(
                "setDataProcessingOptions - LDU automatic geolocation"),
          ),
        ],
      ),
    );
  }
}
