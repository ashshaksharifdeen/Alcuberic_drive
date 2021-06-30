import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:face_attendence/Screens/Login/components/background.dart';
import 'package:face_attendence/Screens/Signup/signup_screen.dart';
import 'package:face_attendence/widgets/already_have_an_account_acheck.dart';
import 'package:face_attendence/widgets/rounded_button.dart';
import 'package:face_attendence/widgets/rounded_input_field.dart';
import 'package:face_attendence/widgets/rounded_password_field.dart';
import 'package:face_attendence/Screens/welcomeclass/classwelcome.dart';
import 'package:face_attendence/Screens/classsignin/classsign.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:face_attendence/Screens/Login/components/frgtlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_attendence/model/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart' as tflite;
import 'dart:math';
import 'dart:typed_data';

class Imageadd extends StatelessWidget {
  final String userid;
  final String classid;
  final List<String> indexnu;
  Imageadd({this.userid, this.classid, this.indexnu});
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        home: ImageCapture(userid: userid, classid: classid, indexnu: indexnu));
  }
}

class ImageCapture extends StatefulWidget {
  final String userid;
  final String classid;
  final List<String> indexnu;
  ImageCapture({this.userid, this.classid, this.indexnu});
  createState() =>
      _ImageCaptureState(userid: userid, classid: classid, indexnu: indexnu);
}

class _ImageCaptureState extends State<ImageCapture> {
  final String userid;
  final String classid;
  final List<String> indexnu;

  _ImageCaptureState({this.userid, this.classid, this.indexnu});

  File _imageFile;
  var imageFile;
  List<Rect> rectArr = [];
  bool isFaceDetected = false;
  tflite.Interpreter _interpreter;

  double threshold = 1.0;
  List input;
  List _predictedData;
  List get predictedData => this._predictedData;

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    setState(() {
      imageFile = cropped ?? imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    imageFile = await selected.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);

    setState(() {
      imageFile = imageFile;
      _imageFile = selected;
    });
    final fbImage = InputImage.fromFile(selected);
    final faceDetector = GoogleMlKit.vision.faceDetector();
    List<Face> listofFaces = await faceDetector.processImage(
        fbImage); //So to do this we need to first let our faceDetector isntance process the firebaseVisionImage and then return to us a list of face.
    //after getting the listOfFaces, we will then use a simple for loop to get all the bindingBox from it. and then put them into another List which will contain a rectangles, since bindingBox gives us a rectangle.

    List<Map<String, int>> faceMaps = [];
    for (Face face in listofFaces) {
      int x = face.boundingBox.left.toInt();
      int y = face.boundingBox.top.toInt();
      int w = face.boundingBox.width.toInt();
      int h = face.boundingBox.height.toInt();
      Map<String, int> thisMap = {'x': x, 'y': y, 'w': w, 'h': h};
      faceMaps.add(thisMap);
    }
    imglib.Image originalImage =
        imglib.decodeImage(File(selected.path).readAsBytesSync());
    imglib.Image faceCrop = imglib.copyCrop(originalImage, faceMaps[0]['x'],
        faceMaps[0]['y'], faceMaps[0]['w'], faceMaps[0]['h']);

    imglib.Image img = imglib.copyResizeCropSquare(faceCrop, 112);
    Float32List imageAsList = imageToByteListFloat32(img);

    setState(() {
      input = imageAsList;
    });

    if (rectArr.length > 0) {
      List<Rect> rectArr = [];
    }
    for (Face face in listofFaces) {
      rectArr.add(face.boundingBox);
    }
    setState(() {
      isFaceDetected = true;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          isFaceDetected
              ? Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //decoration:BoxDecoration(
                        //color: Colors.white,
                        // boxShadow: const [
                        // BoxShadow(blurRadius: 20),
                        // ],
                        // ),
                        //  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                        Expanded(
                          child: FittedBox(
                            child: SizedBox(
                              width: imageFile.width.toDouble(),
                              height: imageFile.height.toDouble(),
                              child: CustomPaint(
                                painter: FacePainter(
                                    rect: rectArr, imageFile: imageFile),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          child: Icon(Icons.crop),
                          onPressed: _cropImage,
                        ),
                        TextButton(
                          child: Icon(Icons.refresh),
                          onPressed: _clear,
                        ),
                        Expanded(
                          child: RoundedButton(
                            text: "Submit",
                            press: () async {
                              //final stuid = await Databaservice(studentid: indexnumber)
                              //  .studentuserid(studentid: indexnumber);
                              //firebaseUser = stuid;
                              try {
                                final gpuDelegateV2 = tflite.GpuDelegateV2(
                                    options: tflite.GpuDelegateOptionsV2(
                                        false,
                                        tflite.TfLiteGpuInferenceUsage
                                            .fastSingleAnswer,
                                        tflite.TfLiteGpuInferencePriority
                                            .minLatency,
                                        tflite.TfLiteGpuInferencePriority.auto,
                                        tflite
                                            .TfLiteGpuInferencePriority.auto));

                                var interpreterOptions =
                                    tflite.InterpreterOptions()
                                      ..addDelegate(gpuDelegateV2);
                                this._interpreter =
                                    await tflite.Interpreter.fromAsset(
                                        'mobilefacenet.tflite',
                                        options: interpreterOptions);
                                print('model loaded successfully');
                              } catch (e) {
                                print('Failed to load model.');
                                print(e);
                              }
                              input = input.reshape([1, 112, 112, 3]);
                              print(input);
                              List output = List.generate(
                                  1, (index) => List.filled(192, 0));

                              print(output);
                              this._interpreter.run(input, output);
                              output = output.reshape([192]);

                              this._predictedData = List.from(output);
                              print(this._predictedData);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
        ], //Uploader(file: _imageFile)
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  List<Rect> rect;
  var imageFile;

  FacePainter({@required this.rect, @required this.imageFile});

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }

    for (Rect rectangle in rect) {
      canvas.drawRect(
        rectangle,
        Paint()
          ..color = Colors.teal
          ..strokeWidth = 6.0
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Float32List imageToByteListFloat32(imglib.Image image) {
  /// input size = 112
  var convertedBytes = Float32List(1 * 112 * 112 * 3);
  var buffer = Float32List.view(convertedBytes.buffer);
  int pixelIndex = 0;

  for (var i = 0; i < 112; i++) {
    for (var j = 0; j < 112; j++) {
      var pixel = image.getPixel(j, i);

      /// mean: 128
      /// std: 128
      buffer[pixelIndex++] = (imglib.getRed(pixel) - 128) / 128;
      buffer[pixelIndex++] = (imglib.getGreen(pixel) - 128) / 128;
      buffer[pixelIndex++] = (imglib.getBlue(pixel) - 128) / 128;
    }
  }
  return convertedBytes.buffer.asFloat32List();
}
