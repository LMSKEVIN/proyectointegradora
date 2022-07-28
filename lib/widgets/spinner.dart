import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Container spinner(BuildContext context){
  const spinkit = SpinKitRotatingCircle(
  color: Colors.amber,
  size: 100.0,
  );
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: spinkit,
  );
}