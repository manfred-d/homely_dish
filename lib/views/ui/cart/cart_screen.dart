import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homely_dish/constants/app_constants.dart';
import 'package:homely_dish/constants/custom_btn.dart';
import 'package:homely_dish/constants/reusable_text.dart';
import 'package:homely_dish/views/common/app_bar.dart';
import 'package:homely_dish/views/common/drawer/drawer_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _quantityController = TextEditingController();
  final _orderInstruction = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = '1';
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _orderInstruction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/onboading/logo.png',
                ),
              ),
            ),
          ],
          text: 'Cart',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                    color: Color(kDarkGreen.value),
                    text: '1 Item(s) in cart',
                    fontweigth: FontWeight.w400,
                    fontsize: 17,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.15,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(kLightGrey.value),
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: const BoxShadow(spreadRadius: 2,blurRadius: 10,),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/onboading/vegetables.png',
                            width: width * 0.2,
                            fit: BoxFit.cover,
                            height: height,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                color: Color(kDarkGreen.value),
                                text: 'Beef, Rice and Vegs',
                                fontweigth: FontWeight.bold,
                                fontsize: 16,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ReusableText(
                                color: Color(kOrange.value),
                                text: 'Ksh: 2000',
                                fontweigth: FontWeight.bold,
                                fontsize: 16,
                              ),
                              SizedBox(
                                width: width * 0.35,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _quantityController.text = '0';
                                      },
                                      icon: Icon(
                                        CupertinoIcons.minus_circled,
                                        color: Color(kDarkGreen.value),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0, vertical: 0.5),
                                        child: TextField(
                                          controller: _quantityController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'),
                                            )
                                          ],
                                          onChanged: (val) {
                                            if (val.isEmpty) {
                                              _quantityController.text = '1';
                                            } else {
                                              return;
                                            }
                                          },
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color(kDarkGreen.value),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        CupertinoIcons.add_circled,
                                        color: Color(kDarkGreen.value),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: null,
                              icon: Icon(
                                CupertinoIcons.delete,
                                color: Color(kOrange.value),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _orderInstruction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: 'Order Instruction',
                  ),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(kDarkGreen.value),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        color: Color(kDarkGreen.value),
                        text: 'Total : ',
                        fontweigth: FontWeight.bold,
                        fontsize: 20,
                      ),
                      ReusableText(
                        color: Color(kOrange.value),
                        text: 'Ksh: 3000',
                        fontweigth: FontWeight.w600,
                        fontsize: 22,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: width,
                  child: CustomElevatedButton(
                    text: 'Order at Ksh:3000',
                    backGcolor: Color(kOrange.value),
                    tcolor: Color(kLightBlue.value),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
