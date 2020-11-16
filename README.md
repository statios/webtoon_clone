# 네이버웹툰 클론코딩

![%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A5%E1%84%8B%E1%85%B0%E1%86%B8%E1%84%90%E1%85%AE%E1%86%AB%20%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%86%AB%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B5%E1%86%BC%201f9a4276f6344399be40858455cd77eb/simulation.gif](%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A5%E1%84%8B%E1%85%B0%E1%86%B8%E1%84%90%E1%85%AE%E1%86%AB%20%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%86%AB%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B5%E1%86%BC%201f9a4276f6344399be40858455cd77eb/simulation.gif)

## Architecture

MVVM with UIKit + RxSwift

![%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A5%E1%84%8B%E1%85%B0%E1%86%B8%E1%84%90%E1%85%AE%E1%86%AB%20%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%86%AB%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B5%E1%86%BC%201f9a4276f6344399be40858455cd77eb/webtoon_clone_architecture_diagram.png](%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A5%E1%84%8B%E1%85%B0%E1%86%B8%E1%84%90%E1%85%AE%E1%86%AB%20%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%86%AB%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B5%E1%86%BC%201f9a4276f6344399be40858455cd77eb/webtoon_clone_architecture_diagram.png)

### Presentation Layer

- ViewController
- ViewModel
- Navigator

### Business Logic Layer

- Interactors (DIP)
- Serivces (DIP)

### Entity Layer

- Models

---

## ETC

- Localize
- Code based autolayout
- Method chaining for building views
- Using a property wrapper for UserDefault
- UI Preview

---

## Libraries

- Kingflisher
- Moya
- RxSwift
- SnapKit
- Resolver

---

## Environment

- XCode 12.1
- Swift 5.2