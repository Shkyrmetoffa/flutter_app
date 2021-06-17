import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/app_localizations.dart';
import 'package:flutter_app/models/locale_models.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart'; //For creating the SMTP Server
import 'package:flutter_app/global.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HttpService {

  Future<List<Localized>> getLocalizedText(url) async {
    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Localized> localized = body.map((dynamic item) => Localized.fromJson(item)).toList();
      return localized;
    } else {
      throw('Can"t get translations');
    }
  }

   Future<List<Post>> getPosts(locale) async {
     final url = '${BaseUrl(locale).url.toString()}';

     Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw('Can"t get posts');
    }
  }

  Future<List<Product>> getProducts(locale) async {
    final url = BaseUrl(locale).url.toString();

    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();

      return products;
    } else {
      throw('Can"t get posts');
    }
  }

  Future<List<Hotels>> getHotels(locale) async {
    final url = BaseUrl(locale).url.toString();

    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Hotels> hotels = body.map((dynamic item) => Hotels.fromJson(item)).toList();

      return hotels;
    } else {
      throw('Can"t get posts');
    }
  }
  Future<List<Restaurants>> getRestaurants(locale) async {
    final url = BaseUrl(locale).url.toString();

    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Restaurants> restaurants = body.map((dynamic item) => Restaurants.fromJson(item)).toList();

      return restaurants;
    } else {
      throw('Can"t get restaurants');
    }
  }
  // !!! For mailer

  sendMail(String username, String password, String recipient, String subject, String html, images) async {
    final smtpServer = gmail(username, password);

    // Creating the Gmail server
    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(recipient) //recipent email
      ..subject = subject //subject of the email
      ..html = html//body of the email
      ..attachments = images.length > 0 ? List<String>.from(images).map((value) {
        return FileAttachment(File(value.toString()));
      }).toList() : [];
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    }
    on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }

  }
}