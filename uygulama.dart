import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Uygulama',
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => MyHomePage(),
              '/about': (context) => AboutPage(),
              '/page1': (context) => Page1(),
              '/page2': (context) => Page2(),
              '/page3': (context) => Page3(),
              '/page4': (context) => Page4(),
              '/page5': (context) => Page5(),
              '/page6': (context) => Page6(),
              '/page7': (context) => Page7(),
              '/page8': (context) => Page8(),
              '/page9': (context) => Page9(),
              '/page10': (context) => Page10(),
              '/page11': (context) => Page11(),
              '/page12': (context) => Page12(),
              '/page13': (context) => Page13(),
              '/page14': (context) => Page14(),
            },
          );
        },
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  bool _darkMode = false;

  bool get isDarkMode => _darkMode;

  void toggleTheme() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Giriş Başarılı!'),
                      content: Text('Ana sayfaya yönlendiriliyorsunuz...'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Text('TAMAM'),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login),
                    SizedBox(width: 8),
                    Text('Giriş Yap'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    List<String> satelliteNames = [
      'TÜRKSAT 1A', 'TÜRKSAT 1B', 'TÜRKSAT 1C', 'TÜRKSAT 2A', 'BİLSAT', 
      'RASAT', 'GÖKTÜRK 2', 'TÜRKSAT 4A', 'TÜRKSAT 4B', 'GÖKTÜRK 1', 
      'TÜRKSAT 5A', 'TÜRKSAT 5B', 'TÜRKSAT 6A', 'İMECE',
    ];

    // Quiz soruları
    List<Question> questions = [
      Question('Türksat 1A hangi yıl fırlatıldı?', '1994', ['1994', '1995', '1996']),
      Question('Rasat ne işe yarar?', 'Uydu', ['Uydu', 'Uçak', 'Gemi']),
      Question('Türksat 5A hangi firma tarafından üretildi?', 'Airbus', ['Airbus', 'Boeing', 'Lockheed Martin']),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Hakkında'),
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.black : Colors.orange[200],
              ),
            ),
            ListTile(
              title: Text('Hakkında'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Çıkış'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Quiz Göster
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(questions: questions)),
                );
              },
              child: Text('Quiz Başlat'),
            ),
            SizedBox(height: 20),
            // Satellite Names List
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  satelliteNames.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/page${index + 1}');
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.orange[100],
                        child: Center(
                          child: Text(
                            satelliteNames[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Bu uygulama Hİ-KOD2 için yapılmıştır'),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 1A'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('TÜRKSAT 1A Türkiyenin ilk iletişim uydusu denemesidir. 24 Ocak 1994te TSİ 23.37de Kouroudan Ariane 4 roketi ile uzaya fırlatılmıştır. Ancak fırlatıcı roketin üçüncü katındaki bir arıza nedeniyle 12 dakika 12 saniye sonra Atlas okanusuna düşmüştür. Sigortalı olduğu için yapım maliyeti sigorta şirketinden alınmıştır. Yerine Türksat 1B yapılmıştır.'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 1B'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('TÜRKSAT 1B Türkiyenin ilk başarılı fırlatılmış ve yörüngeye oturmuş uydusu olup 1994 2006 yılları arasında aktif hizmet vermiş olan TÜRKSAT A.Ş. tarafından işletilen yapay bir iletişim uydusuydu. 10 Ağustos 1994 tarihinde fırlatılmış ve 1994 yılında hizmete girmiştir. Üretimi Alcatel Alenia Space Intdustries tarafından yapılmıştır. 16 Ku transponder ve 6 geniş bant 72 MHz ve 10 dar bant 36 MHzlik iletişim özelliklerine sahiptir. Türkiye, Avrupa ve Orta Asyayı kapsama alanına almaktadır. 12 yıllık görevinin ardından 2006 yılında 31.3 Doğu boylamındaki görevi sona ermiştir. '),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 1C'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('TÜRKSAT 1C, 10 Temmuz 1996da Ariane 4 roketiyle fırlatıldı ve Türkiyeye aitti. Fransız Guyanasından 42.0 Doğu boylamına gönderildi. Türksat tarafından işletiliyordu. 16 Temmuz 2008de Türksat 3Aya sinyal trafiği aktarıldı. Daha sonra görev yeri 31.0 Doğu boylamına taşındı. Uydu, 9 dar bant, 2 orta bant ve 5 geniş bant transpondere sahipti. Batıda Türkiye ve Avrupa, doğuda Türkiye ve Orta Asyayı kapsıyordu. 27 Ekim 2008de yayıncılık sona erdi, ve 23 Eylül 2010da görevine son verildi.'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 2A'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Türksat 2A (Eurasiasat 1), 42 derece doğu boylamında görev yapmış uydudur. Türkiyeye aittir. Türksat 3A ile aynı boylamdadır. 10 Ocak 2001 tarihinde fırlatılmış, 1 Şubat 2001 itibarıyla 42 derece Doğu boylamında göreve başlamıştır. Yerli Yabancı televizyon kanalları ile diğer uydu hizmetleri vermektedir. Türksat tarafından işletilmektedir. Türksat 2A görev süresini 27 Eylül 2016 tarihinde tamamladı.'),
        
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BİLSAT'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('BİLSAT, Türkiyenin ilk elektro optik yer gözlem ve uzaktan algılama uydusudur. 27 Eylül 2003te Rusyanın Plesetsk Rampasından Cosmos-3 fırlatma aracıyla uzaya gönderildi. Tasarlanan 5 yıllık görev ömrü boyunca 686 km irtifada, Güneş ile eşzamanlı bir yörüngede bulunmaktadır. Uydu, pankromatik bantta 12.6 m ve kırmızı, mavi, yeşil bantlarda 27.6 m yer örneklem mesafesine sahiptir. Görevleri arasında haritacılık, afet izleme, kirlilik ve çevre izleme, şehircilik ve planlama bulunmaktadır. Ayrıca, TÜBİTAK UZAY tarafından tasarlanan ve geliştirilen ÇOBAN çok bantlı kamera ve GEZGİN gerçek zamanlı görüntü işleme donanımı da test edilmektedir. Ancak, BİLSAT-1in Ağustos 2006da pil hücrelerinin arızalanması nedeniyle görevine son verildiği bildirilmiştir.'),
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RASAT'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('RASAT, Türkiyede tasarlanan ve üretilen ilk yer gözlem uydusudur. Türkiyenin BiLSAT uydusundan sonra ikinci uzaktan algılama uydusudur. DPTnin sağladığı kaynakla TÜBİTAK UZAY tarafından danışmanlık ya da dış destek almadan geliştirilen uydu, 17 Ağustos 2011 tarihinde Rusyanın Kazakistan sınırındaki Orenburg bölgesinde bulunan Yasny Fırlatma Üssünden Dnepr fırlatma aracıyla uzaya gönderildi. Uydu, 969 saniye içinde yörüngeye yerleşti ve ilk sinyallerini Türkiye saati ile 11.50de göndermeye başladı. 18 Ekim 2011 tarihinde ise uydu tarafından çekilen fotoğrafların TÜBİTAKın yer istasyonundan indirilmeye başlandığı duyuruldu. RASAT, 3 yıllık bir görev ömrüne sahip olacak şekilde tasarlanmıştır. 685 km irtifada, Güneş ile eşzamanlı bir yörüngede bulunmaktadır. Pankromatik bantta 7,5 m ve kırmızı, mavi, yeşil bantlarda 15 m yer örneklem mesafesine sahiptir. Uydu, haritacılık, afet izleme, kirlilik ve çevre izleme ile şehircilik ve planlama gibi amaçlar için kullanılmaktadır. Ayrıca, TÜBİTAK UZAY tarafından tasarlanan ve geliştirilen uçuş bilgisayarı BİLGE, gerçek zamanlı görüntü sıkıştırma donanımı ve Xbant iletişim modülleri de test edilmektedir.'),
      ),
    );
  }
}

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GÖKTÜRK 2'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Göktürk2, TÜBİTAK UZAY, TAI iş birliği ile geliştirilen keşif uydusu. 18 Aralık 2012 tarihinde Çindeki Jiuquan Fırlatma Üssünden uzaya fırlatılmıştır. 409 kg ağırlığındaki uydu 2,5 metre siyah beyaz ve 5 metre renkli çözünürlüğe sahiptir. Uydunun görev bilgisayarı ve görev yazılımı tamamen Türkiyede Türk mühendislerce üretilmiştir.Türkiye Cumhuriyeti tarihi boyunca yüksek çözünürlüklü görüntü alınması için üretilen ilk uydudur.'),
      ),
    );
  }
}

class Page8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 4A'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Türksat 4A, Türk teknik elemanlarının da katkı sağladığı, 14 Şubat 2014 tarihinde saat 23.09da fırlatılan haberleşme uydusudur. Uydu, Japon Mitsubishi Electric firmasının geliştirdiği DS2000 platformu üzerinde inşa edilmiştir. Kazakistandaki Baykonur Uzay Üssünden Proton taşıyıcı roketiyle fırlatılmıştır. Yaklaşık 4 ay boyunca 50 doğu yörüngesinde test işlemleri yapılmıştır. 9 Haziran 2014 tarihinde test yörüngesinden ayrılarak 42 doğu yörüngesine yerleşmiştir. Haziran 2014 sonu itibarıyla hizmet vermeye başlamıştır. 15 Temmuz 2014 tarihinde yapılması planlanan kanal geçişleri, yayıncı kuruluşlar ve Ramazan ayı nedeniyle izleyicilerden gelen yoğun talep üzerine ileri bir tarihe ertelenmiştir. Türksat 4Aya geçiş yapacak olan televizyon ve radyo yayınlarının frekans değişiklikleri, 17 Eylül 2014 tarihini 18 Eylül 2014 tarihine bağlayan gece yarısı gerçekleştirilmiştir.'),
      ),
    );
  }
}

class Page9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 4B'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Türksat 4B, Türk teknik elemanlarının katkı sağladığı bir haberleşme uydusudur. Üretim ve testleri Japon Mitsubishi Electric (MELCO) firmasının Kamakuradaki uydu üretim merkezinde gerçekleştirilmiştir. Uydunun yapımı 30 Haziran 2014 tarihinde tamamlanmış ve test sürecinin ardından 2015 yılının son çeyreğinde fırlatılması planlanmıştır. Ancak, proton roketinde oluşan hasarlar nedeniyle fırlatma tarihi 16 Ekim 2015te TSİ 23:40ta Kazakistanın Baykonur Uzay Üssünden gerçekleştirilmiştir. Türksat 4B, Japon Mitsubishi Electric (MELCO) firmasının geliştirdiği DS2000 platformu üzerinde inşa edilmiş ve Proton taşıyıcı roketiyle fırlatılmıştır.'),
      ),
    );
  }
}

class Page10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GÖKTÜRK 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Göktürk 1, Türk Havacılık ve Uzay Sanayi A.Ş. (TUSAŞ) ve Aselsanın teknoloji katkısıyla İtalyan uzay hizmeti şirketi Telespazio tarafından Millî Savunma Bakanlığı için geliştirilmiş yüksek çözünürlüklü bir yer gözlem uydusudur. Proje kapsamında 13 Temmuz 2009da Millî Savunma Bakanlığı ve Finmeccanica/Thales Grubu ortak girişim şirketi Telespazio arasında anlaşma imzalanmıştır. Uydu, dünyanın herhangi bir yerinde keşif yapmak üzere tasarlanmış olup, çeşitli sivil uygulamalarda kullanılmaktadır. İsrail ile yaşanan anlaşmazlıklar ve teknik gecikmeler sonucunda Göktürk 1, 2016 yılının sonlarında Vega roketi üzerinde uzaya fırlatılmıştır. Göktürk 1B adı altında ikinci bir uydu, fırlatma başarısızlığı veya kapasite artırımı için inşa edilebilir. Göktürk2 ise Göktürk 1e kıyasla daha düşük çözünürlükle 18 Aralık 2012de başarıyla yörüngesine yerleştirilmiş ve yüksek çözünürlüklü imgeler iletmektedir.'),
      ),
    );
  }
}

class Page11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 5A'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Türksat 5A, Türkiye saatiyle 8 Ocak 2021de SpaceX firmasının Falcon 9 roketiyle ABDdeki Cape Canaveral Üssünden uzaya gönderilen haberleşme uydusudur. Kasım 2017de Türksat A.Ş. ile yapılan sözleşme çerçevesinde AIRBUS D&S firması tarafından üretilen bu uydu, 31 Doğu yörüngesinde hizmet vermektedir. Türkiyenin aktif haberleşme uydu sayısını dörde, toplam uydu sayısını ise yediye çıkarmaktadır. Uydu, Eurostar 3000EOR platformu üzerine kurulmuş olup, 12 kilowatt elektrik güç birimiyle çalışmaktadır. Yeni nesil elektrikli itki sistemine sahiptir ve 3,5 ton ağırlığındadır. 31 Doğu yörüngesine yerleştirilen uydu, Türkiye, Avrupa, Orta Doğu, Kuzey Afrika, Orta Batı Afrika, Güney Afrika, Akdeniz, Ege Denizi ve Karadenizi kapsayan geniş bir coğrafyada 1728 MHz kapasiteyle TV yayıncılığı ve veri haberleşmesi hizmetleri sunmaktadır. Uydunun yörüngedeki frekans ve yörünge haklarını 30 yıl boyunca güvence altına alması beklenmektedir. Ayrıca, uydu adına çocuklar için dijital resim sergisi planlanmaktadır.'),
      ),
    );
  }
}

class Page12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 5B'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('19 Aralık 2021de uzaya fırlatılan Türksat 5B, Türkiyenin en güçlü haberleşme uydusudur. 42 Doğu yörüngesinde hizmet verecek olan uydu, Türkiyenin aktif haberleşme uydu sayısını beşe, toplam uydu sayısını ise sekize çıkaracaktır. Sabit Uydu Servisi (FSS) sınıfına göre 20 kat daha fazla kapasite verimliliğine sahip olan Türksat 5B, 4,5 ton fırlatma ağırlığı, 15 kW güç kapasitesi ve yeni nesil elektrikli itki sistemi ile 35 yılı aşkın bir manevra ömrüne sahiptir. Orta Doğu, Basra Körfezi, Kızıldeniz, Akdeniz, Afrika ve komşu ülkeleri kapsayan geniş bir hizmet alanında 55 Gbpsden fazla veri iletim kapasitesi sunacak olan uydu, havacılık ve denizcilikte de kullanılacaktır. Türksat 5B, Türkiyenin internet altyapısını güçlendirerek karasal altyapıyla erişilemeyen bölgelere internet erişimi sağlayacak, Türksatın yerli ve milli uydu anten ailesi PeycONun kapsama alanını ve hızını artıracak ve yerli uydu endüstrisinin geliştirilmesine katkıda bulunacaktır.'),
      ),
    );
  }
}

class Page13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRKSAT 6A'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Türksat 6A, 2024te SpaceX ile fırlatılması planlanan ve yerli haberleşme uydusu platformu geliştiren bir proje. TÜBİTAK, TUSAŞ, ASELSAN ve CTech iş birliğinde yürütülen projede, önceki uzay tecrübeleri değerlendiriliyor. 42 Doğu yörüngesine yerleştirilecek 4 tonluk uydu, Ku ve Ka bantları da içeren çeşitli frekanslarda iletişim sağlayacak. Tamamlanınca TÜRKSAT tarafından işletilecek Türksat 6A, Türkiyenin veri iletişim kapasitesini önemli ölçüde artıracak.'),
      ),
    );
  }
}

class Page14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İMECE'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('İMECE, Türkiyenin ilk yerli yüksek çözünürlüklü görüntüleme uydusudur. 2017de başlayan proje kapsamında TÜBİTAK Uzay tarafından geliştirilen uydu, 15 Nisan 2023te SpaceXin Falcon 9 roketiyle fırlatıldı. 800 kg ağırlığındaki uydu, 680 km yükseklikte güneş eşzamanlı yörüngede görev yapacak ve 0,99 metreye kadar pankromatik ve 3,96 metreye kadar çok spektral görüntü çözünürlüğü sağlayacaktır. 5 yıllık görev süresi boyunca İMECE, Türkiyenin haritalama, şehir planlama, tarım, ormancılık, afet yönetimi gibi alanlarda yüksek çözünürlüklü görüntüler elde etmesine imkan sağlayacaktır.'),
      ),
    );
  }
}

class Question {
  String questionText;
  String correctAnswer;
  List<String> options;

  Question(this.questionText, this.correctAnswer, this.options);
}

class QuizPage extends StatefulWidget {
  final List<Question> questions;

  QuizPage({required this.questions});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == widget.questions[_currentQuestionIndex].correctAnswer) {
      setState(() {
        _score++;
      });
    }
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz Tamamlandı'),
          content: Text('Puanınız: $_score/${widget.questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Kapat'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Soru ${_currentQuestionIndex + 1}/${widget.questions.length}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.questions[_currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ...widget.questions[_currentQuestionIndex].options.map((option) {
              return ElevatedButton(
                onPressed: () {
                  _answerQuestion(option);
                },
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

