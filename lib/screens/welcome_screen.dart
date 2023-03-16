import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/auth_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {

    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    EdgeInsets devicePadding = MediaQuery
        .of(context)
        .padding;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top:160,
                  right: 0,
                  left: 100,
                ),
                child: Container(
                  height: 100,
                  width: 200,
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/images/logo_login.png'),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: 20),
              SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: devicePadding.top + 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 320
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff2A2C28),

                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(

                        padding: const EdgeInsets.only(
                            left: 30, bottom: 25, right: 30, top: 20),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 20, right: 8, top: 5),
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.lexendDeca(
                                      color: Color(0xffD9D9D9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(padding: EdgeInsets.only(right:220),
                              child: Text("Name",
                                style: GoogleFonts.lexendDeca(
                                  color: Color(0xffD9D9D9),
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),),
                              SizedBox(height: 10),
                              TextField(
                                //controller: _emailController,
                                style: GoogleFonts.lexendDeca(
                                  color: Color(0xFF444342),
                                  //fontWeight: ,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff151413),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF444342)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Full name',
                                  hintStyle: GoogleFonts.lexendDeca(
                                    color: Color(0xFF444342),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(padding: EdgeInsets.only(right:175),
                                child: Text("Phone Number",
                                    style: GoogleFonts.lexendDeca(
                                    color: Color(0xffD9D9D9),
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                                ),),
                              SizedBox(height: 10),
                              TextFormField(
                                cursorColor: Colors.blue,
                                controller: phoneController,
                                style: GoogleFonts.lexendDeca(
                                  color: Color(0xFF444342),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    phoneController.text = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff151413),
                                  hintText: "Enter phone number",
                                  hintStyle: GoogleFonts.lexendDeca(
                                    color: Color(0xFF444342),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color:  Color(0xFF444342)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.white),
                                  ),
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.only(top:14.5, left: 11, right: 8),
                                    child: InkWell(
                                      onTap: () {
                                        showCountryPicker(
                                            context: context,
                                            countryListTheme: const CountryListThemeData(
                                              bottomSheetHeight: 550,
                                            ),
                                            onSelect: (value) {
                                              setState(() {
                                                selectedCountry = value;
                                              });
                                            });
                                      },
                                      child: Text(
                                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                        style: GoogleFonts.lexendDeca(
                                          color: Color(0xFF444342),
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                  suffixIcon: phoneController.text.length > 9
                                      ? Container(
                                    height: 30,
                                    width: 30,
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  )
                                      : null,
                                ),
                              ),


                              SizedBox(height: 25),
                              MyElevatedButton(onPressed: () => sendPhoneNumber(),
                                  child: Text(
                                    'Get OTP',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void sendPhoneNumber(){
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  //final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    //this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      width: 100,
      height: height,
      decoration: BoxDecoration(
        //gradient: gradient,
        borderRadius: borderRadius,
        color: Color(0xffE79A56),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}