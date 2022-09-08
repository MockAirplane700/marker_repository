class Youtuber{
  // name, description, socials , linkToMerch ,[markers affiliate links], [sponsors],
  final String name;
  final String description;
  final List<dynamic> socials;
  final String linkToMerch;
  final List<dynamic> markers;
  final List<dynamic> sponsors;

  Youtuber({
    required this.name, required this.description, required this.socials,
    required this.linkToMerch, required this.markers, required this.sponsors
  });
}//end youtuber