---
title: Markdown으로 기록하는 첫 번째 포스트
date: 2026-07-25
category: Engineering
excerpt: assets/posts에 Markdown 파일을 추가하고 GitHub에 push하면 블로그에 자동으로 공개됩니다.
---

# Markdown으로 관리하는 기술 노트

이 포스트는 AINSOFT 블로그의 예제 글입니다. 글의 원본은 `assets/posts` 폴더에 있는 Markdown 파일입니다.

## 배포 흐름

1. `assets/posts`에 `.md` 파일을 추가합니다.
2. 문서 상단에 제목, 날짜, 카테고리, 요약을 작성합니다.
3. GitHub에 push합니다.
4. GitHub Actions가 포스트 목록을 생성하고 Flutter 웹을 배포합니다.

```dart
SmoothMarkdown(
  data: markdownContent,
  selectable: true,
)
```

본문은 `flutter_smooth_markdown`으로 렌더링되므로 표, 코드 블록, 링크 같은 Markdown 문법을 그대로 사용할 수 있습니다.
