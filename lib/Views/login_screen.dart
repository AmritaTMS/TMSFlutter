import 'package:flutter/material.dart';
import 'package:tms/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late Animation<Offset> _offsetAnimation;
  bool _isHidden = false, _staySigned = true;
  String _username = '', _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3140),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 0.06),
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOutCubic,
    ));
    animation.repeat(reverse: true);
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              "TMS",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kCastelon),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //TODO:Logic to launch Intranet
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "INTRANET",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: kMatte),
                  ),
                ),
              )
            ],
            // titleSpacing: MediaQuery.of(context).size.width / 16,
            backgroundColor: kGlacier,
          ),
          backgroundColor: kGlacier,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1239) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 1440, maxHeight: 810),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: SlideTransition(
                              position: _offsetAnimation,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                    "images/rocket.png",
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: FractionallySizedBox(
                            heightFactor: 0.72,
                            widthFactor: 0.8,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                FractionallySizedBox(
                                  heightFactor: 0.94,
                                  child: Card(
                                    elevation: 2,
                                    color: kPowder,
                                    child: Center(
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(32.0),
                                          child: Form(
                                            key: _formKey,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sign in",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          color: kCastelon),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 48.0),
                                                  child: LoginField(
                                                      'Username',
                                                      Icon(
                                                          Icons
                                                              .account_circle_outlined,
                                                          color: kCastelon)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 24.0),
                                                  child: TextFormField(
                                                    cursorColor: kCastelon,
                                                    decoration: InputDecoration(
                                                      //TODO: Error border and error color
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      kCastelon,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8.0))),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      kCamblue,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8.0))),
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      kCamblue,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8.0))),
                                                      labelText: 'Password',
                                                      labelStyle: TextStyle(
                                                          color: kMatte),
                                                      suffixIcon: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            _isHidden =
                                                                !_isHidden;
                                                          });
                                                        },
                                                        child: Icon(
                                                            _isHidden
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: kCastelon),
                                                      ),
                                                    ),
                                                    obscureText: !_isHidden,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 24.0),
                                                  child: Row(
                                                    children: [
                                                      Checkbox(
                                                        activeColor: kCastelon,
                                                        value: _staySigned,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _staySigned =
                                                                value!;
                                                          });
                                                        },
                                                        side: BorderSide(
                                                          color: kCastelon,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Keep me signed in",
                                                        style: TextStyle(
                                                            color: kMatte),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 24.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 6.0),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Forgot Password",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .button!
                                                                .copyWith(
                                                                    color:
                                                                        kMatte),
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: kCastelon,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16.0,
                                                                  vertical:
                                                                      12.0),
                                                          child: Text(
                                                            'Login',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .button!
                                                                .copyWith(
                                                                    color:
                                                                        kGlacier),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.10,
                                      widthFactor: 0.3,
                                      child: Image.asset("images/logo.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                //TODO: PhoneView()
                return Container(
                  color: kCastelon,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  final String text;
  final Icon icon;
  LoginField(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kCastelon,
      decoration: InputDecoration(
        //TODO: Error border and error color
        filled: true,
        fillColor: kCream,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kCastelon, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kCamblue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kCamblue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        labelText: text,
        labelStyle: TextStyle(color: kMatte),
        suffixIcon: icon,
      ),
    );
  }
}
