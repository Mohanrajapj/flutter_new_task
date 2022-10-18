import 'package:api_with_cubit/models/figma_model.dart';
import 'package:api_with_cubit/utils/color_resource.dart';
import 'package:api_with_cubit/utils/image_resource.dart';
import 'package:api_with_cubit/utils/string_resource.dart';
import 'package:api_with_cubit/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/figma_fetch_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            ImageResource.profilePic,
            height: 24,
            width: 24,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              softWrap: true,
              maxLines: 1,
              textScaleFactor: 1,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: StringResource.hey,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18)),
                  TextSpan(
                      text: StringResource.mrMiyagi,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: ColorResource.AppColor)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomText(
              StringResource.whatsYourPlan,
              color: Color(0xffA49EA5),
            ),
          ],
        ),
        actions: [
          Image.asset(
            ImageResource.like,
            height: 20,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              ImageResource.bell,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // height: 56,
            width: size.width,
            child: Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Image.asset(
                  ImageResource.search,
                  height: 20,
                  width: 20,
                ),
                title: CustomText(
                  StringResource.tryRestaurant,
                  color: Color(0xffA49EA5),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FigmaFetchCubit, FigmaFetchState>(
              builder: (context, state) {
                if (state is FigmaFetchLoading) {
                  return const CircularProgressIndicator();
                } else if (state is FigmaFetchError) {
                  return Text(state.failure.message);
                } else if (state is FigmaFetchLoaded) {
                  final figmaList = state.figmaList;
                  return figmaList.isEmpty
                      ? const Text('No Data')
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    ImageResource.star,
                                    height: 15,
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    figmaList[0].subTitle,
                                    color: Color(0xffA49EA5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: CustomText(
                                  figmaList[0].title,
                                  color: Color(0xff473B4A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(10),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: figmaList[0].body.length,
                                  itemBuilder: (context, index) {
                                    final Body figma = figmaList[0].body[index];
                                    return Card(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              figma.url,
                                              height: 150.0,
                                              width: 100.0,
                                            ),
                                          ),
                                          CustomText(
                                            figma.name,
                                            color: Color(0xff473B4A),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 32,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
