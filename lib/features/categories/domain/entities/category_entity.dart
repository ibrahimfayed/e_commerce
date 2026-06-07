class CategoryEntity {
  final String id;
  final String name;
  //final String? description;//i can remove it here
  final String? coverPictureUrl;

  const CategoryEntity({required this.id,required this.name, this.coverPictureUrl});

  
}