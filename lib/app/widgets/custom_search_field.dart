import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/constants/color_constant.dart';
import 'package:moniepoint_test/core/routes/app_routes.dart';
import 'package:moniepoint_test/core/themes/app_style.dart';
import 'package:moniepoint_test/core/utils/size_config/size_config.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    Key? key,

  }) : super(key: key);



  @override
  State<CustomSearch> createState() =>
      _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: kWhite,
            border: Border.all(
                color: Colors.transparent),
            borderRadius:
            BorderRadius.circular(40)),
        child: Center(
            child: TextFormField(
              cursorColor: kPurple,
              cursorWidth: 0.9,
              enabled: false,
              style:
              AppStyle.body.copyWith(color: kGrey),
              onTap: () {
                Navigator.pushNamed(
                    context, AppRoutes.searchScreen);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: kPurple,
                  size: 20,
                ),

                suffixIcon: Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(40),
                      color: Colors.orange,
                    ),
                    child: const Icon(
                        Icons.book_outlined,
                        color: kWhite,
                        size: 20)),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(40),
                    borderSide: BorderSide.none),
                isDense: true,
                fillColor: kWhite,
                filled: true,
                contentPadding: const EdgeInsets.all(
                  18,
                ),
                hintText: "Enter the receipt number...",
                hintStyle: AppStyle.body
                    .copyWith(color: kGrey),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(40),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                //: InputBorder.none,
              ),
              //   onChanged: (){},
            )));

  }}