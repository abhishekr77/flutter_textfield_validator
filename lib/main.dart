import 'package:flutter/material.dart';
import 'package:flutter_validate/validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int seletedValidator = 0;
  final TextEditingController _textEditingController=TextEditingController();
  final List<String> _validatorType = [
    "email",
    "password",
    "name",
    "text",
    "amount",
    'phoneNo',
    'empty',
    'min length',
    'max length',
    'password Confirm',
    'range',
    'PAN',
    'youtube link',
    'url',
    'find'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("TextField Validator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                switch (seletedValidator) {
                  case 0:
                    return Validator.validateEmail(text!);
                  case 1:
                    return Validator.validatePassword(text!,8);
                  case 2:
                    return Validator.validateName(text!,6,"username");
                  case 3:
                    return Validator.pan(text!);
                  case 4:
                    return Validator.validateText(text!, "text");
                  case 5:
                    return Validator.validateAmount(text!);
                  case 6:
                    return Validator.validatePhoneNumber(text!);
                  case 7:
                    return Validator.empty(text!);
                  case 8:
                    return Validator.minLength(
                        value: text!, minLen: 3, message: "min 3 letters");
                  case 9:
                    return Validator.maxLength(
                        value: text!, maxLen: 3, message: "max 10 letters");
                  case 10:
                    return Validator.passwordConfirm(
                        value: text!,
                        message: "max 10 letters",
                        password: "1234");
                  case 11:
                    return Validator.pan(text!);
                  case 12:
                    return Validator.youtubeLink(text!);
                  case 13:
                    return Validator.validateURL(text!);
                  case 14:
                    return Validator.find(text!);
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Select Validate Mode: ",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
              ),
              padding: EdgeInsets.all(8.0), // padding around the grid
              itemCount:  _validatorType.length,
              itemBuilder: (context, index) {
                return     InkWell(
                  onTap: () {
                    seletedValidator = index;
                    _textEditingController.clear();
                    setState(() {});
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: seletedValidator == index
                              ? Colors.blueAccent.withOpacity(0.5)
                              : Colors.blueAccent,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          _validatorType[index].toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                );
              },
            )
            // SizedBox(
            //   height: 40,
            //   child: ListView.separated(
            //       shrinkWrap: true,
            //       itemCount: _validatorType.length,
            //       scrollDirection: Axis.horizontal,
            //       separatorBuilder: (context, index) => const SizedBox(
            //             width: 20,
            //           ),
            //       itemBuilder: (context, index) =>
            //           InkWell(
            //             onTap: () {
            //               seletedValidator = index;
            //               setState(() {});
            //             },
            //             child: Container(
            //                 padding: const EdgeInsets.all(10),
            //                 decoration: BoxDecoration(
            //                     color: seletedValidator == index
            //                         ? Colors.teal.withOpacity(0.5)
            //                         : Colors.teal,
            //                     borderRadius: BorderRadius.circular(12)),
            //                 child: Text(
            //                   _validatorType[index].toString(),
            //                   style: const TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.w400),
            //                 )),
            //           )),
            // )
          ],
        ),
      ),
    );
  }
}
