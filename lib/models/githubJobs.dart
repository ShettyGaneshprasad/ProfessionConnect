class GithubJobsModel {
  String id;
  String type;
  String url;
  String company;
  String companyUrl;
  String location;
  String title;
  String description;
  String howToApply;
  String companyLogo;

  GithubJobsModel(
      {this.company,
      this.companyLogo,
      this.companyUrl,
      this.description,
      this.howToApply,
      this.id,
      this.location,
      this.title,
      this.type,
      this.url}) {
    // print(id + type + url + company + location + title);
  }
}
