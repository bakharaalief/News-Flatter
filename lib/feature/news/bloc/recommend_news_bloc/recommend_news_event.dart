abstract class RecommendNewsEvent {}

class GetRecommendNewsEvent extends RecommendNewsEvent {
  final String category;

  GetRecommendNewsEvent(this.category);
}
