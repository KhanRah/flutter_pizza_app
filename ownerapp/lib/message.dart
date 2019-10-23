import 'package:flutter/material.dart';

@immutable

class Message{
  final  title;
  final  body;


  const Message({
    @required this.title,
    @required this.body
});
}