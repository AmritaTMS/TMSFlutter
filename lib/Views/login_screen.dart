import 'package:flutter/material.dart';
import 'package:tms/constants.dart';
import 'package:tms/Widgets/login_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> tween;
  bool _isHidden = false, _staySigned = true;
  String _username = '', _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2048),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-0.06, 0.04),
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    ));
    tween = Tween<double>(begin: 0, end: 0.015).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
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
                  alignment: Alignment.center,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 1440, maxHeight: 810),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Stack(
                              children: [
                                RotationTransition(
                                  turns: tween,
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
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                      "images/clouds.png",
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: FractionallySizedBox(
                            widthFactor: 0.75,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    elevation: 1,
                                    color: kPowder,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 48.0, horizontal: 32.0),
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
                                                    .copyWith(color: kCastelon),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 48.0),
                                                child: LoginField(
                                                  'Username',
                                                  Icon(
                                                      Icons
                                                          .account_circle_outlined,
                                                      color: kCastelon),
                                                  true,
                                                  (value) {
                                                    setState(() {
                                                      _formKey.currentState!
                                                          .validate();
                                                    });
                                                    _username = value;
                                                  },
                                                  (_username) {
                                                    if (_username!.isEmpty) {
                                                      return 'Please enter a username';
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 24.0),
                                                child: LoginField(
                                                  'Password',
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _isHidden = !_isHidden;
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
                                                  _isHidden,
                                                  (value) {
                                                    setState(() {
                                                      _formKey.currentState!
                                                          .validate();
                                                    });
                                                    _password = value;
                                                  },
                                                  (_password) {
                                                    if (_password!.isEmpty) {
                                                      return 'Please enter a password';
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 32.0),
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      activeColor: kCastelon,
                                                      value: _staySigned,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _staySigned = value!;
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
                                                padding: const EdgeInsets.only(
                                                    top: 32.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                      onPressed: () {
                                                        setState(() {
                                                          _formKey.currentState!
                                                              .validate();
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    24.0,
                                                                vertical: 12.0),
                                                        child: Text(
                                                          'Next',
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: TextButton(
                                        onPressed: () {
                                          //TODO: Implement attribution page
                                        },
                                        child: Text(
                                          "© 2021. Amrita Vishwa Vidyapeetham.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline!
                                              .copyWith(color: kMatte),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (constraints.maxWidth > 599) {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 810),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 1,
                            color: kPowder,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 48.0, horizontal: 32.0),
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
                                            .copyWith(color: kCastelon),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 48.0),
                                        child: LoginField(
                                          'Username',
                                          Icon(Icons.account_circle_outlined,
                                              color: kCastelon),
                                          true,
                                          (value) {
                                            setState(() {
                                              _formKey.currentState!.validate();
                                            });
                                            _username = value;
                                          },
                                          (_username) {
                                            if (_username!.isEmpty) {
                                              return 'Please enter a username';
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 24.0),
                                        child: LoginField(
                                          'Password',
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _isHidden = !_isHidden;
                                              });
                                            },
                                            child: Icon(
                                                _isHidden
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: kCastelon),
                                          ),
                                          _isHidden,
                                          (value) {
                                            setState(() {
                                              _formKey.currentState!.validate();
                                            });
                                            _password = value;
                                          },
                                          (_password) {
                                            if (_password!.isEmpty) {
                                              return 'Please enter a password';
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 32.0),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              activeColor: kCastelon,
                                              value: _staySigned,
                                              onChanged: (value) {
                                                setState(() {
                                                  _staySigned = value!;
                                                });
                                              },
                                              side: BorderSide(
                                                color: kCastelon,
                                                width: 2,
                                              ),
                                            ),
                                            Text(
                                              "Keep me signed in",
                                              style: TextStyle(color: kMatte),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 32.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6.0),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Forgot Password",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button!
                                                      .copyWith(color: kMatte),
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: kCastelon,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _formKey.currentState!
                                                      .validate();
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 12.0),
                                                child: Text(
                                                  'Next',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button!
                                                      .copyWith(
                                                          color: kGlacier),
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
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: TextButton(
                                onPressed: () {
                                  //TODO: Implement attribution page
                                },
                                child: Text(
                                  "© 2021. Amrita Vishwa Vidyapeetham.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(color: kMatte),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 810),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 48.0, horizontal: 32.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sign in",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: kCastelon),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 48.0),
                                      child: LoginField(
                                        'Username',
                                        Icon(Icons.account_circle_outlined,
                                            color: kCastelon),
                                        true,
                                        (value) {
                                          setState(() {
                                            _formKey.currentState!.validate();
                                          });
                                          _username = value;
                                        },
                                        (_username) {
                                          if (_username!.isEmpty) {
                                            return 'Please enter a username';
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 24.0),
                                      child: LoginField(
                                        'Password',
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _isHidden = !_isHidden;
                                            });
                                          },
                                          child: Icon(
                                              _isHidden
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: kCastelon),
                                        ),
                                        _isHidden,
                                        (value) {
                                          setState(() {
                                            _formKey.currentState!.validate();
                                          });
                                          _password = value;
                                        },
                                        (_password) {
                                          if (_password!.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            activeColor: kCastelon,
                                            value: _staySigned,
                                            onChanged: (value) {
                                              setState(() {
                                                _staySigned = value!;
                                              });
                                            },
                                            side: BorderSide(
                                              color: kCastelon,
                                              width: 2,
                                            ),
                                          ),
                                          Text(
                                            "Keep me signed in",
                                            style: TextStyle(color: kMatte),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: kCastelon,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _formKey.currentState!.validate();
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            child: Text(
                                              'Next',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button!
                                                  .copyWith(color: kGlacier),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 6.0),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Forgot Password",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button!
                                                  .copyWith(color: kMatte),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: TextButton(
                                onPressed: () {
                                  //TODO: Implement attribution page
                                },
                                child: Text(
                                  "© 2021. Amrita Vishwa Vidyapeetham.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(color: kMatte),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
