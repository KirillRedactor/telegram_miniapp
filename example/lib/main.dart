import 'package:flutter/material.dart';
import 'package:flutter_telegram_miniapp/flutter_telegram_miniapp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram Mini App Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _colorScheme = 'Not initialized';
  double _viewportHeight = 0.0;
  String _initData = "Empty";
  String _headerColor = "No color set";
  String _mainButtonText = "Main Button";

  @override
  void initState() {
    super.initState();
    _initMiniApp();
  }

  Future<void> _initMiniApp() async {
    try {
      WebApp().init();
      setState(() {
        _colorScheme = WebApp().colorScheme.name;
        _viewportHeight = WebApp().viewportHeight;
        _initData = WebApp().initDataUnsafe.user?.firstName ?? 'No user data';
        _headerColor = WebApp().headerColorRaw ?? "No color set";
      });
      _setupEventListeners();
    } catch (e) {
      print('Error initializing Mini App: $e');
      setState(() {
        _colorScheme = 'Initialization error';
      });
    }
  }

  void _setupEventListeners() {
    final eventHandler = WebApp().eventHandler;

    eventHandler.themeChanged.listen((theme) {
      setState(() {
        _colorScheme = theme.$1.name;
      });
      print("Theme changed: ${theme.$1.name}");
    });

    eventHandler.viewportChanged.listen((data) {
      setState(() {
        _viewportHeight = data.$2;
      });
      print("Viewport changed: ${data.$2}");
    });

    eventHandler.mainButtonClicked.listen((event) {
      print('Main button clicked');
      _showPopup();
    });
  }

  Future<void> _showPopup() async {
    final popupParams = PopupParams(
        message: "Some message",
        buttons: [PopupButton(text: "OK", type: PopupButtonType.ok)]);

    final buttonId = await WebApp().showPopupAsync(params: popupParams);
    print("Button clicked: $buttonId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mini App Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Color Scheme: $_colorScheme',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('Viewport Height: $_viewportHeight',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('Init Data: $_initData', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('Header Color: $_headerColor',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    WebApp().setHeaderColor(Colors.red);
                    setState(() {
                      _headerColor = WebApp().headerColorRaw ?? "No color set";
                    });
                  },
                  child: Text('Set Header Color to Red'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    WebApp().mainButton.setText("Main button changed");
                    setState(() {
                      _mainButtonText = WebApp().mainButton.text;
                    });
                  },
                  child: Text('Change main button text'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
                onPressed: () async {
                  final result =
                      await WebApp().showConfirmAsync(message: "Some message");
                  print("User clicked: $result");
                },
                child: const Text('Confirm popup')),
            TextButton(
                onPressed: () {
                  WebApp().mainButton.show();
                  WebApp().mainButton.setText(_mainButtonText);
                },
                child: Text("Show main button")),
            TextButton(
                onPressed: () async {
                  final result = await WebApp().requestContactAsync();
                  print("User shared contact: $result");
                },
                child: Text("Request Contact")),
          ],
        )));
  }
}
