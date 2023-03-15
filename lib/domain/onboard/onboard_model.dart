import '../../utils/utils.dart';

class OnboardModel {
  final String image;
  final String title;
  final String description;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardModel> onboardData = [
  OnboardModel(
    image: AssetUtils.onboard1,
    title: "Easy Way to Buy",
    description: "You can easily buy our products using this app",
  ),
  OnboardModel(
    image: AssetUtils.onboard2,
    title: "Easy Way to Order",
    description: "Users can easily place order using this app",
  ),
  OnboardModel(
    image: AssetUtils.onboard3,
    title: "Secure and Safe Delivery",
    description: "Place order and get your product delivered safely",
  ),
];
