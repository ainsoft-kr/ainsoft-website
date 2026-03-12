---
stepsCompleted:
  - 1
inputDocuments:
  - _bmad-output/01-product-brief.md
  - README.md
  - lib/main.dart
  - lib/app.dart
  - lib/core/bindings/bindings.dart
  - lib/core/routing/route_manager.dart
  - lib/modules/auth/auth_bindings.dart
  - lib/modules/menu/menu_bindings.dart
workflowType: 'architecture'
project_name: 'homepage'
user_name: 'Ygpark2'
date: '2026-03-12'
---

# Flutter Modular 재설계안

## 1. 배경

- `pubspec.yaml` 은 이미 `flutter_modular: ^6.4.1` 로 전환되었음
- 하지만 실제 앱 구조는 아직 `GetMaterialApp`, `GetPage`, `Bindings`, `Get.find()`, `Obx`, `GetxController` 에 강하게 결합되어 있음
- 현재 제품 방향은 `_bmad-output/01-product-brief.md` 기준으로 "웹 전용 기업 홈페이지" 이며, 핵심 퍼블릭 라우트는 `Home`, `About`, `Products`, `Contact`, 이후 `Solutions` 확장임

따라서 이번 재설계의 핵심은 단순한 `GetX API 치환` 이 아니라, 웹 사이트에 맞는 `모듈 중심 라우팅 + 명시적 DI + URL 중심 상태` 구조로 앱 조립 방식을 바꾸는 것이다.

## 2. 현재 구조의 문제

### 2.1 앱 부트스트랩이 GetX 중심

- [lib/app.dart](/Users/ygpark2/pjt/ainsoft/website/lib/app.dart) 는 `GetMaterialApp` 과 `InitialBindings()` 에 의존
- [lib/core/bindings/bindings.dart](/Users/ygpark2/pjt/ainsoft/website/lib/core/bindings/bindings.dart) 가 전역 의존성 등록 지점 역할을 수행
- [lib/core/routing/route_manager.dart](/Users/ygpark2/pjt/ainsoft/website/lib/core/routing/route_manager.dart) 가 `Get.toNamed`, `Get.offAllNamed` 래퍼 역할을 함

이 구조는 `flutter_modular` 의 `Module + RouteManager + Injector` 조합과 역할이 중복된다.

### 2.2 기능 모듈이 아니라 바인딩 묶음에 가깝다

- 각 feature 는 `*_bindings.dart` 로만 DI 를 구성
- `AuthBindings` 가 인증 성공/실패 시 다른 모듈 바인딩을 등록/삭제하는 식으로 라이프사이클을 수동 관리
- 모듈 경계보다 "언제 Get registry 에 넣고 뺄지" 가 구조의 중심이 되어 있음

`flutter_modular` 에서는 라우트와 DI 를 같은 `Module` 안에서 선언하고, 스코프 종료 시 dispose 되도록 설계하는 편이 자연스럽다.

### 2.3 URL 이 소스 오브 트루스가 아님

- [lib/modules/menu/controllers/menu_view_model.dart](/Users/ygpark2/pjt/ainsoft/website/lib/modules/menu/controllers/menu_view_model.dart) 는 현재 페이지를 `Widget` 자체로 들고 있음
- 웹 사이트인데도 내비게이션 상태가 URL 이 아니라 ViewModel 내부 상태에 묶여 있음

이 방식은 다음 문제를 만든다.

- 브라우저 주소와 실제 화면 상태가 분리됨
- 직접 링크 진입, 뒤로가기, SEO 대응, analytics 추적이 약해짐
- `RouterOutlet` 기반 중첩 라우팅 장점을 활용하지 못함

### 2.4 Actions 레이어가 정적 싱글턴 + 숨겨진 DI 에 의존

- [lib/modules/auth/actions/auth_actions.dart](/Users/ygpark2/pjt/ainsoft/website/lib/modules/auth/actions/auth_actions.dart) 는 내부에서 `Get.find()` 로 의존성을 가져옴
- 생성 시점과 스코프가 명확하지 않고 테스트에서 대체 주입이 불편함

### 2.5 제품 방향과 맞지 않는 템플릿 잔재가 루트 구조에 남아 있음

- 기업 홈페이지 MVP 기준이면 `auth`, `menu`, `posts` 는 핵심 퍼블릭 플로우가 아님
- 지금은 이 예제성 모듈들이 앱 루트 구조를 주도하고 있음

즉, `flutter_modular` 전환은 동시에 "웹사이트 본체" 와 "예제/관리/인증 영역" 을 구조적으로 분리하는 기회여야 한다.

## 3. 재설계 목표

1. 라우트와 DI 의 소유권을 `Module` 로 이동한다.
2. 퍼블릭 웹사이트는 URL 이 상태의 기준이 되도록 만든다.
3. 전역 서비스와 기능 서비스의 스코프를 분리한다.
4. `GetX Controller` 를 제거하고도 기존 MVVM + Actions 의 장점은 유지한다.
5. 웹 MVP 와 맞지 않는 템플릿 모듈은 루트 앱 셸에서 분리한다.

## 4. 핵심 설계 결정

### 4.1 `Bindings` 를 전부 `Module` 로 치환한다

`flutter_modular 6.x` 기준으로 라우팅과 DI 는 아래 단위로 재구성한다.

- `binds(Injector i)`: 현재 모듈 내부에서만 쓰는 의존성
- `exportedBinds(Injector i)`: 다른 모듈이 import 해서 재사용할 전역/공용 의존성
- `routes(RouteManager r)`: 해당 모듈의 라우트 선언

즉, 아래 치환이 기본 규칙이다.

- `InitialBindings` -> `CoreModule`
- `RouteManager` -> `AppModule.routes` + `AppNavigator`
- `<feature>_bindings.dart` -> `<feature>_module.dart`
- `AuthMiddleware` -> `AuthGuard`

### 4.2 루트 앱은 `AppModule + AppWidget` 구조로 바꾼다

권장 부트스트랩:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Bootstrap.initialize();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
```

`AppWidget` 는 `MaterialApp.router(routerConfig: Modular.routerConfig)` 를 사용하고, 테마/로케일만 전역 상태에서 구독한다.

### 4.3 퍼블릭 웹사이트를 하나의 셸 모듈로 재구성한다

기업 홈페이지는 페이지별 독립 URL 이 중요하므로, 기존 `menu` 모듈처럼 현재 페이지 `Widget` 을 들고 있는 구조를 버리고 `RouterOutlet` 기반 셸을 사용한다.

권장 라우팅:

- `/` -> Home
- `/about`
- `/products`
- `/solutions`
- `/contact`
- `/auth/login` (선택)
- `/dashboard` (선택, 보호 라우트)

### 4.4 `auth`, `menu`, `posts` 는 루트 퍼블릭 셸에서 분리한다

현재 brief 기준으로는 퍼블릭 홈페이지가 제품의 중심이므로:

- `menu` 모듈은 삭제하거나 `site_shell` 로 흡수
- `posts` 는 샘플/실험 모듈로 `modules/lab` 또는 `modules/demo` 로 이동
- `auth` 는 실제 관리자/CRM/문의관리 기능이 생길 때만 별도 모듈로 유지

### 4.5 상태관리는 `Modular` 에 맡기지 않고 단순화한다

`flutter_modular` 은 상태관리 프레임워크가 아니라 DI + 라우팅 도구다. 이 프로젝트는 웹 기업 홈페이지이므로 과한 상태관리 도입보다 아래처럼 단순화하는 것이 맞다.

- 전역 설정: `ValueNotifier` 또는 `ChangeNotifier`
- 기능 상태: `ChangeNotifier` 기반 `Store` 또는 얇은 `Controller`
- 비동기 화면 상태: 기존 `ApiResponse<T>` 유지 가능
- 뷰 액션: 주입 가능한 `Actions` 클래스로 유지하되 정적 싱글턴 제거

권장 명명:

- `ThemeViewModel` -> `ThemeStore`
- `LocalizationViewModel` -> `LocaleStore`
- `ConnectionViewModel` -> `ConnectivityStore`
- `AuthViewModel` -> `AuthStore`

## 5. 목표 디렉터리 구조

```text
lib/
  main.dart
  app/
    app_module.dart
    app_widget.dart
    app_routes.dart
    bootstrap.dart
    guards/
      auth_guard.dart
    navigation/
      app_navigator.dart
  core/
    core_module.dart
    errors/
    network/
      api_service.dart
      cache/
    storage/
      app_storage_service.dart
      preferences_storage.dart
      secure_token_storage.dart
    session/
      session_store.dart
    settings/
      theme_store.dart
      locale_store.dart
    connectivity/
      connectivity_store.dart
      reachability_service.dart
  shared/
    presentation/
      widgets/
      layout/
      actions/
    extensions/
    utils/
    content/
  modules/
    site/
      site_module.dart
      presentation/
        shell/
          site_shell_page.dart
          site_navigation_bar.dart
          site_footer.dart
      home/
        presentation/
          pages/home_page.dart
          widgets/
        data/
          home_content.dart
      about/
        about_module.dart
        presentation/
        data/
      products/
        products_module.dart
        presentation/
        application/
        data/
      solutions/
        solutions_module.dart
        presentation/
        data/
      contact/
        contact_module.dart
        presentation/
        application/
        data/
    auth/
      auth_module.dart
      presentation/
      application/
      data/
    dashboard/
      dashboard_module.dart
      presentation/
      application/
    demo/
      posts/
        posts_module.dart
        presentation/
        application/
        data/
```

## 6. 모듈 책임 분리

### 6.1 `AppModule`

책임:

- 앱 전체의 최상위 route tree 선언
- `CoreModule` import
- 퍼블릭/보호/실험 모듈 연결
- 404 fallback 정의

예시:

```dart
class AppModule extends Module {
  @override
  List<Module> get imports => [
    CoreModule(),
  ];

  @override
  void routes(RouteManager r) {
    r.module('/', module: SiteModule());
    r.module('/auth', module: AuthModule());
    r.module('/dashboard', module: DashboardModule(), guards: [AuthGuard()]);
    r.module('/demo', module: DemoModule());
    r.wildcard(child: (_) => const NotFoundPage());
  }
}
```

### 6.2 `CoreModule`

책임:

- 전역 인프라 제공
- 다른 모듈이 공통으로 써야 하는 bind 를 `exportedBinds` 로 공개

포함 대상:

- `AppStorageService`
- `PreferencesStorage`
- `SecureTokenStorage`
- `ApiService`
- `CacheManager`
- `ThemeStore`
- `LocaleStore`
- `ConnectivityStore`
- `SessionStore`
- `AppNavigator`

주의:

- feature 의 화면 상태는 `CoreModule` 에 두지 않는다
- `AuthStore` 는 앱 전체 로그인 상태가 실제로 필요한 경우에만 core 또는 auth import bind 로 노출한다

### 6.3 `SiteModule`

책임:

- 퍼블릭 홈페이지 셸 제공
- 공통 레이아웃과 내비게이션 유지
- URL 기반 nested route 처리

구조:

- 최상위 `SiteShellPage`
- 내부 body 는 `RouterOutlet`
- 상단 메뉴 활성 상태는 현재 path 로 계산

즉, 기존 `MenuViewModel.currentPage` 같은 위젯 저장 로직은 제거한다.

### 6.4 개별 페이지 모듈

`home`, `about`, `products`, `solutions`, `contact` 는 아래 기준으로 분리한다.

- 정적 콘텐츠 위주: `data + presentation`
- 폼/비동기 처리 존재: `data + application + presentation`
- 외부 API 호출 존재: 해당 feature module 내부 `binds` 에 service/store 등록

## 7. 레이어 설계

### 7.1 Presentation

역할:

- 위젯 렌더링
- 라우트 파라미터 해석
- store/controller 구독
- actions 호출

금지:

- `Modular.get()` 직접 남용
- storage/http 직접 호출
- 화면 내부에서 의존성 생성

### 7.2 Application

역할:

- 사용자 의도 처리
- 비즈니스 플로우 조합
- store 갱신
- navigation 위임

구성 예:

- `ContactActions`
- `AuthActions`
- `ProductsController`
- `ContactFormStore`

현재 `ActionPresenter` 패턴은 유지 가능하지만, 반드시 생성자 주입 기반으로 바꾼다.

### 7.3 Data

역할:

- API/스토리지 접근
- 모델 매핑
- 정적 콘텐츠 제공

현재 `AuthService`, `PostService`, `LocalizationService` 같은 클래스는 계속 유지 가능하지만 `Get` API 의존 코드는 제거해야 한다.

## 8. 웹 라우팅 전략

### 8.1 URL 을 메뉴 상태보다 우선한다

현재:

- 메뉴 클릭 -> ViewModel 이 `Widget` 교체

변경 후:

- 메뉴 클릭 -> `Modular.to.navigate('/products')`
- 활성 메뉴 계산 -> 현재 URI path 기준
- 브라우저 뒤로가기/직접 링크/새로고침 시 동일 화면 복원

### 8.2 `RouterOutlet` 기반 셸

`SiteShellPage` 예시:

```dart
class SiteShellPage extends StatelessWidget {
  const SiteShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CorporatePageScaffold(
      currentRoute: Modular.to.path,
      child: const RouterOutlet(),
    );
  }
}
```

### 8.3 보호 라우트는 `RouteGuard`

현재 `AuthMiddleware` 는 GetX 전용이다. 이를 `flutter_modular` 의 `RouteGuard` 기반으로 치환한다.

예시:

```dart
class AuthGuard extends RouteGuard {
  AuthGuard(this._sessionStore) : super(redirectTo: '/auth/login');

  final SessionStore _sessionStore;

  @override
  Future<bool> canActivate(String path, ParallelRoute route) async {
    return _sessionStore.isAuthenticated;
  }
}
```

## 9. 전역 서비스 재배치

### 9.1 유지할 것

- `ApiService`
- `CacheManager`
- `AppStorageService`
- `PreferencesStorage`
- `SecureTokenStorage`

이들은 `GetX` 때문이 아니라 인프라 계층이므로 유지 가치가 높다.

### 9.2 변경할 것

- `LocalizationService` 의 `Get.deviceLocale`, `Get.updateLocale` 제거
- `ThemeViewModel` 의 `Get.changeThemeMode` 제거
- `ConnectionViewModel` 의 `GetxController` 제거

대신:

- `LocaleStore` 는 `ValueNotifier<Locale>` 또는 `ChangeNotifier`
- `ThemeStore` 는 `ValueNotifier<ThemeMode>` 또는 `ChangeNotifier`
- `ConnectivityStore` 는 `ChangeNotifier + StreamSubscription + Disposable`

## 10. 기존 파일 매핑

| 현재 파일 | 변경 방향 |
| --- | --- |
| `lib/main.dart` | `Bootstrap.initialize()` + `ModularApp` 진입점으로 변경 |
| `lib/app.dart` | `lib/app/app_widget.dart` 로 이동 |
| `lib/core/bindings/bindings.dart` | 삭제, `lib/core/core_module.dart` 로 대체 |
| `lib/core/routing/route_manager.dart` | 삭제, `lib/app/app_routes.dart` + `AppNavigator` 로 대체 |
| `lib/modules/*/*_bindings.dart` | 전부 `*_module.dart` 로 대체 |
| `lib/modules/auth/auth_middleware.dart` | `lib/app/guards/auth_guard.dart` 로 대체 |
| `lib/modules/menu/*` | `modules/site/presentation/shell/*` 로 흡수 또는 제거 |
| `lib/modules/*/controllers/*_view_model.dart` | `application/*_store.dart` 또는 `*_controller.dart` 로 치환 |
| `lib/modules/*/actions/*_actions.dart` | 정적 싱글턴 제거 후 DI 가능한 action/coordinator 로 변경 |

## 11. 단계별 마이그레이션 순서

### 1단계: 부트스트랩 전환

- `ModularApp` 도입
- `MaterialApp.router` + `Modular.routerConfig` 로 교체
- 기존 `GetMaterialApp` 제거

### 2단계: CoreModule 구성

- 현재 `main.dart`, `InitialBindings`, `ThemeBindings`, `LocaleBindings`, `ConnectionsBindings` 에 흩어진 전역 등록을 `CoreModule` 로 이동
- 앱 시작 전 필요한 비동기 초기화만 `Bootstrap.initialize()` 에 남김

### 3단계: 퍼블릭 사이트 셸 재구성

- `menu` 구조 제거
- `SiteModule + SiteShellPage + RouterOutlet` 도입
- `Home/About/Products/Solutions/Contact` 를 URL 라우트로 연결

### 4단계: feature DI 전환

- 각 `*_bindings.dart` 삭제
- feature 별 `binds(Injector i)` 로 store/service 등록

### 5단계: GetX 상태 제거

- `GetxController`, `.obs`, `Obx`, `GetWidget` 제거
- `ChangeNotifier`, `ValueNotifier`, `AnimatedBuilder`, `ListenableBuilder` 로 치환

### 6단계: navigation/action 정리

- `RouteManager` 삭제
- `AppNavigator` 또는 직접 `Modular.to` 사용 기준 정립
- 정적 `Actions.instance` 제거

### 7단계: 템플릿 잔재 정리

- `posts` 를 demo 모듈로 격리하거나 제거
- `auth` 가 불필요하면 비활성화
- README 와 문서 전부 `GetX` 문구 제거

## 12. 구현 우선순위

### 우선 적용

- `main.dart`
- `app.dart`
- `core/bindings`
- `core/routing`
- `menu` 모듈
- `theme`, `locale`, `connections`

### 이후 적용

- `auth`
- `posts`
- 문서/예제

## 13. 권장 코드 스켈레톤

```dart
class ProductsModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(const ProductsContentProvider());
    i.add(ProductsController.new);
    i.add(ProductsActions.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const ProductsPage(),
    );
  }
}
```

```dart
class ProductsActions {
  ProductsActions(this._controller, this._navigator);

  final ProductsController _controller;
  final AppNavigator _navigator;

  Future<void> openContact() async {
    _controller.prepareInquiry();
    _navigator.go('/contact');
  }
}
```

## 14. 최종 권고

이 프로젝트는 "범용 모바일 템플릿" 이 아니라 "웹 전용 기업 홈페이지" 로 방향이 좁혀졌다. 따라서 구조도 그 현실에 맞춰야 한다.

최종 권고는 다음과 같다.

1. `GetX` 를 1:1 치환하지 말고 앱 셸을 `SiteModule` 중심으로 다시 세운다.
2. `flutter_modular` 은 라우팅/DI 만 담당하게 하고 상태관리는 단순 `Listenable` 기반으로 가져간다.
3. `menu` 기반 화면 스위칭을 버리고 URL 기반 nested routing 으로 바꾼다.
4. `auth`, `posts` 같은 템플릿 유산은 퍼블릭 사이트와 분리한다.
5. 실제 구현은 `CoreModule -> SiteModule -> 개별 feature module` 순서로 진행한다.

## 15. 참고 메모

- 본 문서는 PRD 없이 현재 코드베이스와 product brief 를 기준으로 작성되었다.
- 이후 PRD 가 생기면 보호 라우트, 관리자 영역, 문의 플로우, CMS 연동 여부까지 반영해 상세 아키텍처를 확장하는 것이 맞다.
