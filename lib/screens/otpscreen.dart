import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/auth_provider.dart';
import 'package:reckon_farmyaar/screens/welcome_screen.dart';
import 'package:reckon_farmyaar/utils/utils.dart';

import 'UserInfoScreen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;
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
          child: isLoading == true ? const Center(child: CircularProgressIndicator(color: Color(0xffE79A56))):
          Stack(
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
              //SizedBox(height: 50),

              // SizedBox(height: 20),
              SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: devicePadding.top + 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 410
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
                                  "Verify",
                                  style: GoogleFonts.lexendDeca(
                                    color: Color(0xffD9D9D9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(padding: EdgeInsets.only(right:205),
                                child: Text("Enter OTP",
                                  style: GoogleFonts.lexendDeca(
                                    color: Color(0xffD9D9D9),
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),),
                              SizedBox(height: 10),
                              Pinput(
                                length: 6,
                                showCursor: true,
                                defaultPinTheme: PinTheme(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff151413)
                                  ),
                                  textStyle: GoogleFonts.lexendDeca(
                                    color: Color(0xFF444342),
                                    fontSize: 20,
                                  )
                                ),
                                onCompleted: (value) {
                                  setState(() {
                                    otpCode = value;
                                  });
                                },
                              ),
                              // TextField(
                              //   //controller: _emailController,
                              //   style: GoogleFonts.lexendDeca(
                              //     color: Color(0xFF444342),
                              //     //fontWeight: ,
                              //     fontSize: 15,
                              //   ),
                              //   decoration: InputDecoration(
                              //     filled: true,
                              //     fillColor: Color(0xff151413),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(color: Color(0xFF444342)),
                              //       borderRadius: BorderRadius.circular(12),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //           color: Colors.white),
                              //       borderRadius: BorderRadius.circular(12),
                              //     ),
                              //     hintText: 'Full name',
                              //     hintStyle: GoogleFonts.lexendDeca(
                              //       color: Color(0xFF444342),
                              //     ),
                              //     border: InputBorder.none,
                              //   ),
                              // ),
                              SizedBox(height: 10),
                              Padding(padding: EdgeInsets.only(left:184),
                                child: Text("Resend OTP",
                                  style: GoogleFonts.lexendDeca(
                                    color: Color(0xffD9D9D9),
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),),
                              SizedBox(height: 20),
                              // TextFormField(
                              //   cursorColor: Colors.blue,
                              //   controller: phoneController,
                              //   style: GoogleFonts.lexendDeca(
                              //     color: Color(0xFF444342),
                              //   ),
                              //   onChanged: (value) {
                              //     setState(() {
                              //       phoneController.text = value;
                              //     });
                              //   },
                              //   decoration: InputDecoration(
                              //     filled: true,
                              //     fillColor: Color(0xff151413),
                              //     hintText: "Enter phone number",
                              //     hintStyle: GoogleFonts.lexendDeca(
                              //       color: Color(0xFF444342),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: const BorderSide(color:  Color(0xFF444342)),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: const BorderSide(color: Colors.white),
                              //     ),
                              //     prefixIcon: Container(
                              //       padding: const EdgeInsets.only(top:14.5, left: 11, right: 8),
                              //       child: InkWell(
                              //         onTap: () {
                              //           showCountryPicker(
                              //               context: context,
                              //               countryListTheme: const CountryListThemeData(
                              //                 bottomSheetHeight: 550,
                              //               ),
                              //               onSelect: (value) {
                              //                 setState(() {
                              //                   selectedCountry = value;
                              //                 });
                              //               });
                              //         },
                              //         child: Text(
                              //           "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                              //           style: GoogleFonts.lexendDeca(
                              //             color: Color(0xFF444342),
                              //             fontSize: 17,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     suffixIcon: phoneController.text.length > 9
                              //         ? Container(
                              //       height: 30,
                              //       width: 30,
                              //       margin: const EdgeInsets.all(10.0),
                              //       decoration: const BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         color: Colors.green,
                              //       ),
                              //       child: const Icon(
                              //         Icons.done,
                              //         color: Colors.white,
                              //         size: 20,
                              //       ),
                              //     )
                              //         : null,
                              //   ),
                              // ),
                              //
                              //
                              // SizedBox(height: 25),
                              MyElevatedButton(onPressed: (){
                                if(otpCode != null){
                                  verifyOtp(context, otpCode!);
                                }
                                else{
                                  showSnackBar(context, "Enter 6-Digit code");
                                }
                              },
                                  child: Text(
                                    'Submit',
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
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
            ap.checkExistingUser().then((value) async {
              if(value==true){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Dashboard()), (route) => false);
              }else
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Dashboard()), (route) => false);
                }
            });
        }
    );
  }
}
