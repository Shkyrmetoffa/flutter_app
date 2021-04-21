import 'package:flutter/material.dart';
import 'package:flutter_app/components/contactUsForm.dart';
import 'package:flutter_app/components/reportFraudForm.dart';
import 'package:flutter_app/menu/menuScreen.dart';
import 'package:flutter_app/pages/certificateCheckScreen.dart';
import 'package:flutter_app/pages/enumbersScreen.dart';
import 'package:flutter_app/pages/homeScreen.dart';
import 'package:flutter_app/pages/hotelsScreen.dart';
import 'package:flutter_app/pages/productsScreen.dart';
import 'package:flutter_app/pages/restaurantsScreen.dart';
import 'package:flutter_app/pages/splashScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/menu':
        return MaterialPageRoute(builder: (_) => MenuScreen());
      case '/enumbers':
        return MaterialPageRoute(builder: (_) => EnumbersScreen());
      case '/restaurants':
        return MaterialPageRoute(builder: (_) => RestaurantsScreen());
      case '/hotels':
        return MaterialPageRoute(builder: (_) => HotelScreen());
      case '/products':
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case '/certificate':
        return MaterialPageRoute(builder: (_) => CertificateCheckScreen());
      case '/fraud':
        return MaterialPageRoute(builder: (_) => ReportFraudForm());
      case '/contact':
        return MaterialPageRoute(builder: (_) => ContactUsForm());

        default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name ?? ""}'),
            ),
          );
        });
    }
  }
}

// {
// '/': (BuildContext context) => SplashScreen(),
// '/home': (BuildContext context) => HomeScreen(),
// '/post': (BuildContext context) => PostPage(),
// '/menu': (BuildContext context) => MenuScreen(),
// '/enumbers': (BuildContext context) => EnumbersScreen(),
// '/restaurants': (BuildContext context) => RestaurantsScreen(),
// '/hotels': (BuildContext context) => HotelScreen(),
// '/products': (BuildContext context) => ProductsScreen(),
// '/certificate': (BuildContext context) =>
// CertificateCheckScreen(),
// '/fraud': (BuildContext context) => ReportFraudForm(),
// '/contact': (BuildContext context) => ContactUsForm(),
// }