import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // let's Add Banner Ad in our Application
  BannerAd? bannerAd;
  bool isloaded = false;
  // Here i am using flutter 2 so, i have to add ? for mull safety
  //if you are at lower version of flutter  then no need to do it
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isloaded = true;
        });
        print("Banner Ads Loaded");
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: AdRequest(),
    );
    bannerAd!.load();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Google Ads"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 400,
            color: Colors.pink,
          ),
          Container(
            child: isloaded
                ? Container(
                    height: 50,
                    //  width: bannerAd?.size.width.toDouble(),
                    child: AdWidget(ad: bannerAd!),
                    alignment: Alignment.center,
                  )
                : SizedBox(),
          ),
          Container(
            height: 100,
            width: 400,
            color: Colors.pink,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
