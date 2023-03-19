import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  List<Article> articles = [];
  @override
  
  void initState() {
    super.initState();
    getWebsiteData();
  }
  
  Future getWebsiteData() async {
    final url = Uri.parse("https://economictimes.indiatimes.com/news/economy/agriculture");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
    .querySelectorAll('div > h3 > a ')
    .map((element) => element.innerHtml.trim())
    .toList();

    final subtitle = html
    .querySelectorAll('div > p')
    .map((element) => element.innerHtml.trim())
    .toList();

    final urlImages = html
        .querySelectorAll(' div > div > span > span > img')
        .map((element) => element.attributes['data-original']!)
        .toList();

    final dates = html
        .querySelectorAll(' div > div > time')
        .map((element) => element.attributes['data-time'])
        .toList();


    // print('Count: ${titles.length}');
    // for(final title in titles) {
    //   debugPrint(title);
    //
    // }
    // print('Count: ${urlImages.length}');
    // for(final stitle in urlImages) {
    //   debugPrint(stitle);
    //
    // }


    setState(() {
      articles = List.generate(
        titles.length,(index) => Article(
          url: subtitle[index],
        // url: '',
          title: titles[index],
          urlImage: urlImages[index],
          date: ''),
      );
    });
  }


  
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151413),
        // body: Center(
        //   child: Text("Latest News",
        //     style: TextStyle(
        //         color: Colors.white
        //     ),
        //     // color: Colors.white),
        //   ),
        // )
        body:ListView.builder(
          padding: const EdgeInsets.only(top:12),
          itemCount: articles.length,
          itemBuilder: (context, index){
            final article = articles[index];

            // return Padding(
            //   padding: const EdgeInsets.only(top: 20, bottom: 20),
            //   child: ListTile(
            //     leading: Image.network(
            //         article.urlImage,
            //         width: 50,
            //       fit: BoxFit.fill,
            //     ),
            //     // Text(article.title.contains('>') ? article.title.substring(article.title.indexOf('>')+1, ) : article.title
            //     title: Container(
            //       color: Color(0xff2A2C28),
            //       child: Text(
            //         article.title.contains('>') ? article.title.substring(article.title.indexOf('>')+1, ) : article.title,
            //         style: GoogleFonts.lexendDeca(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //
            //     subtitle: Text(article.url,
            //       style: GoogleFonts.lexendDeca(
            //         color: Colors.white,
            //       ),),
            //   ),
            // );

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Card (
                color: Color(0xff2A2C2B),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                      article.title.contains('>') ? article.title.substring(article.title.indexOf('>')+1, ) : article.title,
                        style: GoogleFonts.lexendDeca(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(4.0),
                        color: Color(0xff2A2C28),
                      ),

                    ),
                    Container(
                      width: double.infinity,
                      child: Image.network(
                          article.urlImage,
                        fit: BoxFit.fill,
                        //width: double.infinity,

                      ),
                    ),
                  Container(
                    color: Color(0xff2A2C28),
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        article.url,
                        style: GoogleFonts.lexendDeca(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),),
                  ]
                )


              ),
            );
          }
        )
    );
  }
}

class Article {
  final String url;
  final String title;
  final String urlImage;
  final String date;

  const Article ({
    required this.url,
    required this.title,
    required this.urlImage,
    required this.date,
});

}
