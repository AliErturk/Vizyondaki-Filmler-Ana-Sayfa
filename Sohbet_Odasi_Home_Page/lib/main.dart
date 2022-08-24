import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sohbet_odasi_home_page/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const[
        Locale("en",""),
        Locale("tr","")
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var a = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(a!.siteBaslik,
        style: TextStyle(fontFamily: "Permanent",fontSize: 30),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 8.0),
              child: Text(a.altBaslik,style: TextStyle(fontSize: 20,fontFamily: "Bree",color: Colors.blueGrey,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Label(icerik: a.sinema,),
                  Label(icerik: a.bilimKurgu,),
                  Label(icerik: a.aksiyon,),
                  Label(icerik: a.gerilim,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 16),
              child: Text(a.filmler,style: TextStyle(fontSize: 20,fontFamily: "Bree",color: Colors.blueGrey,fontWeight: FontWeight.bold),),
            ),
            Filmler(filmAdi: a.inception, katilimciSayisi: a.katilimIns,
              filmAfisi: "resimler/Inception.png", imdbPuani: a.imdbIns,
              yonetmenAdi: a.yonetmenIns,biletAl: a.biletAl,),
            Filmler(filmAdi: "Dune", katilimciSayisi: a.katilimDune,
              filmAfisi: "resimler/dune.png",imdbPuani: a.imdbDune ,
              yonetmenAdi: a.yonetmenDune,biletAl: a.biletAl,),
            Filmler(filmAdi: "Matrix", katilimciSayisi: a.katilimMat,
              filmAfisi: "resimler/matrix_wall.png",imdbPuani:a.imdbMat ,
              yonetmenAdi: a.yonetmenMat,biletAl: a.biletAl,),
          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  String icerik;

  Label({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){print("tıklandı");},
        child: Text(icerik,style: TextStyle(fontFamily: "Bree",color: Colors.black54,),),
        style: TextButton.styleFrom(
          backgroundColor: labelRenk,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
        ),
    );
  }
}
class Filmler extends StatelessWidget {
  String filmAdi;
  String katilimciSayisi;
  String filmAfisi;
  String imdbPuani;
  String yonetmenAdi;
  String biletAl;

  Filmler({required this.filmAdi,required this.katilimciSayisi,required this.filmAfisi,required this.imdbPuani,required this.yonetmenAdi,required this.biletAl});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(filmAdi,style: TextStyle(fontSize: 20,fontFamily: "Bree",color: Colors.black,fontWeight: FontWeight.bold),),
              Image.asset(filmAfisi,height: 100,width: 100,),
              Text(katilimciSayisi,style: TextStyle(fontSize: 10,fontFamily: "Bree",color: Colors.blueGrey,fontWeight: FontWeight.bold),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0,right: 13.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("resimler/imdb.png",height: 50,width: 50,),
                Text(imdbPuani,style: TextStyle(fontSize: 10,fontFamily: "Bree",color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                Text(yonetmenAdi,style: TextStyle(fontSize: 10,fontFamily: "Bree",color: Colors.blueGrey,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(width: 75,height: 45,
            child: TextButton(
              onPressed: (){},
              child: Text(biletAl,style: TextStyle(color: Colors.white,fontSize: 18),),
              style: TextButton.styleFrom(backgroundColor: katilButonuRenk),
            ),
          )
        ],
      ),
    );
  }
}





