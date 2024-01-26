import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              margin:const EdgeInsets.only(top: 50),
              child:const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: AuthCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _nodeText1 = FocusNode();
  final _customController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
        tapOutsideBehavior: TapOutsideBehavior.none,
        //autoScroll: true,
        config: _buildConfig(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 1.0,
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    
                    TextFormField(
                        decoration:const InputDecoration(
                            labelText: 'Input Number with done button'),
                        focusNode: _nodeText1,
                         controller: _customController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next),
                    
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.transparent,
      keyboardBarElevation: 0.0,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
      ],
    );
  }
}