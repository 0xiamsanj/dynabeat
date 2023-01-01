import 'package:dynabeat/controller/music_data_fetch.dart';
import 'package:dynabeat/utils/export.dart';
import 'package:dynabeat/widgets/component_widgets/music_card_widget.dart';
import 'package:dynabeat/widgets/helper_widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

final _songDetails = Get.put(SongFetchController());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: GetX<SongFetchController>(
        init: SongFetchController(),
        initState: (_) {},
        builder: (logic) {
          return Scaffold(
            backgroundColor: const Color(0xff161A1A),
            body: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.height * 1,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      logo(),
                      const CircleAvatar(),
                    ],
                  ).paddingOnly(right: 15, left: 7),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 350,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        child: TextFormField(
                          controller: _songDetails.songNameSearch,
                          onFieldSubmitted: (str) {
                            _songDetails.fetchSong(str);
                          },
                          style: const TextStyle(
                              fontFamily: "Gotham",
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _songDetails.fetchSong(
                                    _songDetails.songNameSearch.text);
                              },
                            ),
                            hintText: "Enter song",
                            hintStyle: const TextStyle(
                                fontFamily: "Gotham", color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  textWidget(
                          "Songs", 20, FontWeight.w500, const Color(0xffe6c8ff))
                      .paddingSymmetric(horizontal: 15),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 220,
                    child: _songDetails.isLoading.value
                        ? const Center(
                            child: SpinKitCircle(
                              color: Color(0xffe6c8ff),
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _songDetails.musicList.length,
                            itemBuilder: (_, index) {
                              return MusicCard(
                                index: index,
                                music: _songDetails.musicList[index],
                              );
                            }),
                  ).marginSymmetric(horizontal: 7),
                  const SizedBox(
                    height: 15,
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
