String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }

String httpToHttps(String link){
  if(!link.contains('https')){
    return link.replaceAll('http', 'https');
  } else {
    return link;
  }
}