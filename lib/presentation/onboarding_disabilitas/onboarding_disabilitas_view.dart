// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io' show Platform;
import 'package:ebeasiswa/presentation/onboarding/onboarding_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import 'onboarding_disabilitas_controller.dart';

enum TtsState { playing, stopped, paused, continued }

class OnBoardingDisabilitas extends StatefulWidget {
  const OnBoardingDisabilitas({super.key});

  @override
  State<OnBoardingDisabilitas> createState() => _OnBoardingDisabilitasState();
}

class _OnBoardingDisabilitasState extends State<OnBoardingDisabilitas> {

  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText;
  int? _inputLength;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  String tempText = "Selamat datang insan LPDP, tampilan ini bersifat sementara dan dapat berubah. kami sangat peduli dengan insan lpdp dimana pun berada. fitur ini dibuat khusus untuk penyandang disabilitas anda dapat melakukan tap pada tombol tidak, apakah ingin menggunakan fitur tersebut ?";

  @override
  initState() {
    super.initState();
    initTts();
    initLoadTempGesture();
  }

  final OnboardingDisabilitasController onboardingDisabilitasController =
      Get.put(OnboardingDisabilitasController());
  
  initLoadTempGesture()async{
    await _speak(tempText);
    onboardingDisabilitasController.startTimer(10);
  }
  
  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

   Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;

  Future<dynamic> _getEngines() async => await flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _speak(String text) async {
    await flutterTts.setVolume(100);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    // _newVoiceText = "para insan LPDP yang sedang berbahagia";
    if (text != '') {
      if (text.isNotEmpty) {
        await flutterTts.speak(text);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: Get.width * 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFFAF53),
            Color(0xffFF8226),
            Color(0xffFF6C06),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.image.lpdpLogo
              .image(fit: BoxFit.cover, height: 70, width: 220),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                GestureDetector(
                  onTap: () => _speak('mulyana anak LPDP banget'),
                  child: const Text(
                    'Selamat datang insan LPDP, tampilan ini bersifat sementara dan dapat berubah',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
             const   SizedBox(
                  height: 5,
                ),
               const Text(
                  'kami sangat peduli dengan insan lpdp dimana pun berada',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
               const SizedBox(
                  height: 5,
                ),
               const Text(
                  'fitur ini dibuat khusus untuk penyandang disabilitas anda dapat melakukan tap pada tombol tidak, apakah ingin menggunakan fitur tersebut ?',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
               const SizedBox(
                  height: 5,
                ),
              const Text(
                        'fitur akan berubah terhitung dari',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
              width: 200,
              child:
                  ElevatedButton(onPressed: () {
                    onboardingDisabilitasController.setDisabilitasMode(true);
                    Get.offAll(const OnBoardingView());
                  }, child:  Obx(() => Text('Tidak (${onboardingDisabilitasController.remainSeconds})'))))
        ],
      ),
    )));
  }
}
