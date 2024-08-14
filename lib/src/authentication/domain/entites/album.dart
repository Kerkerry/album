class Album{
  final String id;
  final String title;
  final String description;
  final String url;
  final String createdAt;

  const Album({required this.id,required this.title, required this.description, required this.url, required this.createdAt});

  Album.empty():this(id:"1",title:"title",description:"description",url:"https://images.unsplash.com/photo-1509114397022-ed747cca3f65?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",createdAt:"2024-03-21T04:10:07.098Z");
}