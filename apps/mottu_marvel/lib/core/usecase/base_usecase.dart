abstract class Usecase<TReturn, TParam> {
  TReturn call({TParam? param});
}
