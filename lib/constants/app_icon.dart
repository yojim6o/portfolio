class AppIcon {
  static const String _icons = '/icons';

  static String en = '$_icons/en.svg';
  static String es = '$_icons/es.svg';
  static String linkedin = '$_icons/ic-linkedin.svg';
  static String github = '$_icons/ic-github.svg';
}

class AppUrl {
  static Uri linkedinUri = Uri(
    scheme: "https",
    host: "www.linkedin.com",
    path: "/in/gabriel-engu%C3%ADdanos-web/",
  );

  static Uri githubUri = Uri(
    scheme: "https",
    host: "github.com",
    path: "yojim6o",
    query: "?tab=repositories",
  );
}