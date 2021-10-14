//Öncelikle boş uygulama çerçevesi oluşturulmak zorundadır.

//Material dart projesi dahil edilir.
import 'package:flutter/material.dart';

//Ana Blog açılır ve içine uygulamanın ana widgetı konur.
//=> ile gösterilen ifadeler Arrow fxn denir.
void main() => runApp(MyApp());

//Stateless Widget ile uygulamanın ana widgetı oluşturulur.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Çatı widget olan materialApp dönderilir.

//Bu widget içerinde tüm değerler elle girdiği için ve değişmeyeceği için const değeri ile gösterilmesi daha doğrudur.
//Her uygulamanın home'u olmak zorundadır ve tektir. Home MaterialApp içerisinde yazılır.

    return const MaterialApp(
      //Uygulamaya başlık verelim.
      title: "Hesap Makinesi",
      //homeparametresi aktif edilir ve iskele widgetı dönderilir. AnaSayfanın Iskele Classı olduğu gösterir.
      home: Iskele(),
    );
  }
}

//MaterailApp içerisinde belirlenen Home Amasayfayı temsil eder.
//Ekranda herhang bir değişme olmayacağı sade ve değişmez sayfalar için Stateless kullanılır.
//Statefull ile değişebilecek sayfalar içindir.
class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Tüm ekranı kaplayan widgettır. içerisinde Appbar ve Bosy vardır.
      //AppBar parametresi aktif edilir AppBar başlığı verilir.
      appBar: AppBar(
        title: const Text("Basit Hesap Makinesi"),
      ),
      //Body parametresi ile artık ana ekranı döndürür.
      body: const AnaEkran(),
    );
  }
}

//Geri kalan tüm kodlar bu statefull içine yazılır.
class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  //Kullanıcıdan alınacak olan değerler burada tanımlanır.
  //Değişkenler num tipinde yazılsın çünkü bu sayede tam ve ondalıklı sayı atanabilir.
  num? sayi1, sayi2, sonuc;

  //Sayıların bir Textfielddan alınması gerekir. Fakat flutterda TextField isimlendirilemez.
  //Bu sebepten TextField bir nesne ile bağlanır. Bu nesne sayesinde TextField içerisindeki değer okunabilir.

  TextEditingController t1 = TextEditingController(
      text: "0"); //Textfield için varsayılan bir değer yazılabilir.
  TextEditingController t2 = TextEditingController();

//Yapılacak olan işlemler için gerekli fxnlar override üzerine yazılır.
  sayiTopla() {
    //Öncelikle setState yapısı kullanılmak zorundadır çünkü fxn çalıştığında
    //state güncellenmeli ve ekran yeniden oluşturulmalıdır. Eğer bu yapı
    //kullanılmazsa programdaki değişiklikler ekrana yansımaz.
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2
          .text); //Text türünden değişkeni num değerine çevirmek için işlem yapılır.
      sonuc = sayi1! +
          sayi2!; //Değer tanımlanırken ? kullanılan durumda bu değişekn ile işlem yapılırken ! kullanılması gerekir.
    });
  }

  sayiCikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1! - sayi2!;
    });
  }

  sayiCarp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1! * sayi2!;
    });
  }

  sayiBol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1! / sayi2!;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Buildcontext içerisine ekranda gözükecek görseller yazılır.
    //BuildContext sonrası bir return widget değeri tanımlanmalıdır.
    return Container(
      //Containerın child'ı olmak zorundadır. Asla Children değeri almaz.
      //Ekrandaki bileşenlerin diğer bileşenlere olan uzaklığına margin denir.
      margin: EdgeInsets.all(50.0),

      //Ekrandaki bileşeleri altalta dizmek için bu yapı oluşturulur.
      child: Center(
        //Center tek başına kullanılmaz childa sahip olmak zorundadır.
        //Column widgtın childi olmaz bu yüden children kullanılır.

        child: Column(
          //Column arkasında sınırsız satır oluşturur bu satırları aktif edebilmek için children içine widgetlar yazılmalıdır.
          children: <Widget>[
            //Column widgetının içine diğer widgetlar konabilir.
            //Text içerisine sadece string değer geldiği için bu şekilde yazarak bir string gibi gösterebiliriz.
            Text("$sonuc"),
            //Kullanıcıdan alınacak olan değerlerin girilebilmesi için bir alanlardır.
            TextField(
              //Oluşturulan nesne burada belirtilmelidir. Bunun için controller aktif edilir ve belirtilir.
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            //İşlemler için buton koyalım.
            RaisedButton(
              //Onpressed parametresi fxnu alırken parametre istemez.
              onPressed: sayiTopla,
              child: Text("Topla"),
            ),
            RaisedButton(
              onPressed: sayiCikar,
              child: Text("Çıkar"),
            ),
            RaisedButton(
              onPressed: sayiCarp,
              child: Text("Çarp"),
            ),
            RaisedButton(
              onPressed: sayiBol,
              child: Text("Böl"),
            ),
          ],
        ),
      ),
      //Bu sonucu ekranda göstermek için bir text widget konulur.
    );
  }
}
