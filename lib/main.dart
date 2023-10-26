
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
  List<String> _validatorType = ["phone", "email", "min length", "pan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (s) {
                switch (seletedValidator) {
                  case 0:
                    return Validator.phone(s!);
                  case 1:
                    return Validator.email(s!);
                  case 2:
                    return Validator.minLength(
                        value: s!, minLen: 3, message: "min length 3");
                  case 3:
                    return Validator.pan(s!);
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Select Validate Mode: ",style: TextStyle(fontWeight: FontWeight.w400),),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _validatorType.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context,index)=>const SizedBox(width: 20,),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          seletedValidator = index;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color:seletedValidator==index? Colors.teal.withOpacity(0.5): Colors.teal,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(_validatorType[index].toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
