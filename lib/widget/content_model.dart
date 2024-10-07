class OnboardingContent{
  String image;
  String title;
  String description;
  OnboardingContent({required this.description,required this.image,required this.title});
}

List<OnboardingContent> contents=[
  OnboardingContent(description: 'Pick Your from menu\n  More then 35' , image: "assets/images/VisitorOne.png", title: 'Select from Our\n  Best Menu'),
  OnboardingContent(description: 'You can pay cash on delivery and\n Card Payment also available' , image: "assets/images/StayInvolved.jpg", title: 'Easy and online Payment'),
  OnboardingContent(description: 'Deliver food at your door step ' , image: "assets/images/Money.jpg", title: 'Quick delivery at your doorstep'),
];