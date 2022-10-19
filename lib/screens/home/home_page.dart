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
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: size.height / 1.8,
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
                          : Column(
                              children: [
                                EventMainTile(
                                  figmaList: figmaList,
                                  size: size,
                                  index: 0,
                                ),
                                EventMainTile(
                                  figmaList: figmaList,
                                  size: size,
                                  index: 1,
                                ),
                                EventMainTile(
                                  figmaList: figmaList,
                                  size: size,
                                  index: 2,
                                ),
                                EventMainTile(
                                  figmaList: figmaList,
                                  size: size,
                                  index: 3,
                                ),
                              ],
                            );
                    }

                    return const Icon(Icons.access_alarm);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventMainTile extends StatelessWidget {
  const EventMainTile({
    Key? key,
    required this.figmaList,
    required this.size,
    required this.index,
  }) : super(key: key);

  final List<Result> figmaList;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                figmaList[index].subTitle,
                color: Color(0xffA49EA5),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomText(
              figmaList[index].title,
              color: Color(0xff473B4A),
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: size.height / 2,
            child: EventsList(
              figmaList: figmaList,
              ind: index,
            ),
          ),
        ],
      ),
    );
  }
}

class EventsList extends StatelessWidget {
  const EventsList({
    Key? key,
    required this.figmaList,
    required this.ind,
  }) : super(key: key);

  final List<Result> figmaList;
  final int ind;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: figmaList[ind].body.length,
        itemBuilder: (context, index) {
          final Body figma = figmaList[ind].body[index];
          return Container(
            width: 186,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200)),
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                // mainAxisAlignment:
                //     MainAxisAlignment.end,
                children: [
                  Stack(children: [
                    SizedBox(
                      height: 176,
                      width: 176,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          "https://image.shutterstock.com/image-photo/healthy-lunch-workplace-pick-food-260nw-1855267585.jpg",
                          // figma.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                            height: 24,
                            width: 24,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset(
                              ImageResource.like,
                            ))),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          height: 24,
                          // width: 24,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                  ImageResource.done,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: CustomText(
                                  figma.likes,
                                  color: Color(0xff473B4A),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset(
                            ImageResource.yellowTag,
                            fit: BoxFit.fill,
                          ),
                        ))
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    figma.name,
                    color: Color(0xff473B4A),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  figma.price == "None"
                      ? SizedBox()
                      : CustomText(
                          figma.price,
                          color: Color(0xff473B4A),
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                  figma.content == "None"
                      ? SizedBox()
                      : CustomText(
                          figma.content,
                          color: Color(0xff473B4A),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                  figma.location == "None"
                      ? SizedBox()
                      : DetaileTiles(
                          text: figma.location,
                          img: ImageResource.location,
                        ),
                  figma.category == "None"
                      ? SizedBox()
                      : DetaileTiles(
                          text: figma.category,
                          img: figma.category == "Restaurant"
                              ? ImageResource.restaurant
                              : figma.category == "Museum"
                                  ? ImageResource.musium
                                  : ImageResource.foodMarket,
                        ),
                  figma.event == "None"
                      ? SizedBox()
                      : DetaileTiles(
                          text: figma.event,
                          img: figma.event == "Comedy"
                              ? ImageResource.comedy
                              : ImageResource.comedy,
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetaileTiles extends StatelessWidget {
  const DetaileTiles({
    Key? key,
    required this.text,
    required this.img,
  }) : super(key: key);

  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            height: 15,
            width: 15,
            child: Image.asset(
              img,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          CustomText(
            text,
            color: Color(0xff473B4A),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
