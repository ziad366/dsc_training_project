import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit.dart';
import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit_states.dart';
import 'package:dsc_training_project/screens/HomePage.dart';
import 'package:dsc_training_project/screens/Cards.dart';
import 'package:dsc_training_project/screens/Orders.dart';
import 'package:dsc_training_project/screens/Setting.dart';
import 'package:dsc_training_project/screens/SignIn.dart';
import 'package:dsc_training_project/screens/SignUp.dart';
import 'package:dsc_training_project/screens/dark_mode.dart';

// import 'package:dsc_training_project/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';

void main() => runApp(
      //multi bloc state management provider
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ECommerceCubit()),
        ],
        //consume to access the data in cubit
        child: BlocConsumer<ECommerceCubit, ECommerceStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: "DSC E-commerce project",
              initialRoute: HomePage.id,
              routes: {
                HomePage.id: (context) => HomePage(),
                Cards.id: (context) => Cards(),
                Orders.id: (context) => Orders(),
                Setting.id: (context) => Setting(),
                SignIn.id: (context) => SignIn(),
                SignUp.id: (context) => SignUp(),
                DarkMode.id: (context) => DarkMode(),
                // ProductPage.id: (context) =>ProductPage(),
              },
              debugShowCheckedModeBanner: false,

              //toggle between modes
              themeMode: ECommerceCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,

              theme: lightTheme(),
              darkTheme: darkTheme(),
            );
          },
        ),
      ),
    );

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: whiteColor,
    cardColor: cartWhite70ColorLight,
    iconTheme: const IconThemeData(
      color: defaultOrangeColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: defaultOrangeColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      backgroundColor: whiteColor,
      titleTextStyle: const TextStyle(
        fontSize: 26,
        color: blackColor,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      //item name
      headline1: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: blackColor),
      //item size
      headline2: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: greyColor,
      ),
      //item price
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      //item amount
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: blackColor,
      ),
      //item status
      headline5: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: blackColor,
      ),
      //subtitle
      subtitle1: TextStyle(
        color: blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      //button
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    backgroundColor: blackColor,
    cardColor: cartWhite70ColorDark,
    iconTheme: const IconThemeData(
      color: defaultOrangeColor,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: defaultOrangeColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
      backgroundColor: blackColor,
      titleTextStyle: TextStyle(
        fontSize: 26,
        color: whiteColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: blackColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      //item name
      headline1: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),
      //item size
      headline2: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: greyColor,
      ),
      //item price
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      //item amount
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
      //item status
      headline5: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
      //subtitle
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      //button
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

// =======
// import 'package:dsc_training_project/screens/HomePage.dart';
// import 'package:dsc_training_project/screens/Cards.dart';
// import 'package:dsc_training_project/screens/Orders.dart';
// import 'package:dsc_training_project/screens/Setting.dart';
// import 'package:dsc_training_project/screens/SignIn.dart';
// import 'package:dsc_training_project/screens/SignUp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//   runApp(MaterialApp(
//     title: "DSC E-commerce project",
//     initialRoute: SignIn.id,
//     debugShowCheckedModeBanner: false,
//     routes: {
//       HomePage.id: (context) => HomePage(),
//       Cards.id: (context) => Cards(),
//       Orders.id: (context) => Orders(),
//       Setting.id: (context) => Setting(),
//       SignIn.id: (context) => SignIn(),
//       SignUp.id: (context) => SignUp(),
//     },
//   ));
// }
//
//
