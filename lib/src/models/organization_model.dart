class OrganizationModel {
  const OrganizationModel({
    this.id = 171,
    this.name = 'Organização legal',
    this.slogan = 'Startup',
    this.phone = '(41)9 9775-5207',
    this.email = 'lucasdemeloaguirre@gmail.com',
    this.website = 'www.google.com.br',
    this.address = 'Rua São Mateus 504 - Portão, Curitiba',
  });

  final int id;
  final String name;
  final String phone;
  final String slogan;
  final String email;
  final String website;
  final String address;
}