import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:app/config/CustomTextStyle.dart';
import 'package:app/config/Colors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SubmitInput extends StatefulWidget {
  SubmitInput({
    Key? key,
    required this.onValidate,
    this.showMic = false,
    required this.textPlaceholder,
    this.showIcon = true,
    this.inputBorder,
    this.fontSizeInput = 17,
    this.label = "",
    this.controller,
    this.error = false,
    this.hide = false,
  }) : super(key: key);

  Function(String) onValidate;
  bool showMic;
  bool showIcon;
  String textPlaceholder;
  Border? inputBorder;
  double fontSizeInput;
  String label;
  TextEditingController? controller;
  bool error;
  bool hide;

  @override
  _MainInput createState() => _MainInput();
}

class _MainInput extends State<SubmitInput> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  var _text = TextEditingController();
  double _confidence = 1.0;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        var locales = await _speech.locales();
        var selectedLocale = locales.firstWhere((element) {
          return element.localeId == 'fr_FR';
        });

        setState(() => _isListening = true);
        _speech.listen(
          localeId: selectedLocale.localeId,
          onResult: (val) => setState(() {
            _text.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            _isListening = false;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {

    final searchIcon = Container(
      padding: EdgeInsets.only(left: 10),
        child: Image(
          image: AssetImage('assets/images/icons/search.png'),
          width: 18,
        )
    );

    final input = Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          width: 100,
          height: 200,
          decoration: BoxDecoration(
          ),
          child: TextField(
            cursorColor: Pcolors.orange,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
              hintText: widget.textPlaceholder,
              fillColor: Colors.white,
              filled: true,
            ),
            controller: _text,
            style: CustomTextStyle.quicksandRegular(context, Colors.black, widget.fontSizeInput),
            onSubmitted: widget.onValidate,
          ),
        )
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 7, left: 5),
            child: Text(
              widget.label,
              textAlign: TextAlign.left,
              style: CustomTextStyle.quicksandMedium(context, Colors.black, 15),
            ),
          ),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: widget.inputBorder,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(100, 0, 0, 0),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              if (widget.showIcon) ...[
                searchIcon,
              ],
              input,
              if (widget.showMic) ...[
                InkWell(
                  onTap: _listen,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: AvatarGlow(
                      animate: _isListening,
                      glowColor: _isListening ? Pcolors.purple : Colors.white,
                      endRadius: 50.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ],
    );
  }
}