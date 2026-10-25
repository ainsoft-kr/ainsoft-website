# AINSOFT Website

AINSOFT 회사 웹사이트입니다. Flutter Web으로 만들고 GitHub Pages로 배포하며,
도메인은 [ain.ai.kr](https://ain.ai.kr)입니다.

## 시작하기

Flutter stable(3.47 이상)이 필요합니다.

```bash
flutter pub get
make web-run          # 개발 서버 실행 (WEB_RUN_PORT로 포트 지정)
flutter test
make web-build        # 배포용 정적 파일을 build/web에 생성
```

## 구조

```
lib/
├── main.dart              # 폰트·설정 초기화 후 ModularApp 실행
├── app.dart               # MaterialApp.router, 테마·언어, 반응형 breakpoint
├── app_module.dart        # 라우트 목록 (모든 페이지가 SiteShellPage 안에서 렌더링)
├── core/
│   ├── bindings/          # 앱 전역 서비스 등록 (coreModule)
│   ├── config/            # 외부 엔드포인트 (문의 폼 Lambda URL 등)
│   ├── infrastructure/    # 폰트 로더, 로딩 표시, 설정 저장소
│   └── routing/           # RouteManager: 경로 상수와 이동 함수
├── modules/               # 페이지별 모듈 (home, about, products, solutions,
│                          #   services, posts, contact) + connections, locale, theme
└── shared/                # 디자인 토큰·테마, 앱 셸(헤더·푸터·하단 탭), 공용 위젯
```

- **라우팅·DI**: [flutter_modular](https://pub.dev/packages/flutter_modular) 7.
  화면 이동은 `RouteManager.offAll(...)`처럼 `RouteManager`를 통해 합니다.
  사이트 페이지는 URL이 바뀌어야 하므로 push가 아니라 navigate를 씁니다.
  서비스는 `inject<T>()`로 가져옵니다.
- **상태**: 각 화면의 view model은 `ChangeNotifier`입니다.
- **URL**: 해시 방식(`/#/products`)을 씁니다.

## 블로그 글

글은 `assets/posts/`의 Markdown 파일이고
[flutter_smooth_markdown](https://pub.dev/packages/flutter_smooth_markdown)으로 렌더링합니다.
front matter를 넣어 파일을 추가하고 `main`에 push하면 됩니다.

```markdown
---
title: 글 제목
date: 2026-07-25
category: Engineering
excerpt: 글 목록에 보이는 짧은 요약.
---

# 글 제목

본문.
```

목록은 `assets/posts/manifest.json`에서 읽습니다. 배포 워크플로가
`tool/generate_posts_manifest.dart`로 자동 생성하며, 로컬에서 확인할 때는
`dart tool/generate_posts_manifest.dart`를 직접 실행합니다.

## 한글 폰트

첫 화면이 빨리 뜨도록 Noto Sans KR 전체 대신, 사이트에 쓰는 글자만 담은
`google_fonts/NotoSansKR-critical[wght].ttf`를 첫 프레임 전에 불러옵니다.
`lib/`에 새 한글 문구를 추가했다면 폰트를 다시 만들어야 합니다.
빠진 글자는 다른 글꼴로 보입니다.

```bash
git show 'cc95526^:google_fonts/NotoSansKR[wght].ttf' > /tmp/NotoSansKR-full.ttf
uv run --with fonttools python tool/subset_korean_font.py /tmp/NotoSansKR-full.ttf
```

## 배포

`main`에 push하면 `.github/workflows/deploy-pages.yml`이 실행됩니다.
글 목록 생성 → `flutter test` → web 빌드 → GitHub Pages 배포 순서이고,
테스트가 실패하면 배포하지 않습니다. 빌드에는 `web/CNAME`(ain.ai.kr)과
딥링크용 `404.html`이 함께 들어갑니다.
