---
name: AINSOFT Website
description: 운영팀장·CTO에게 "AINSOFT가 무엇을 제공하는 회사인가"를 한 번에 기억시키는 기업 홈페이지의 시각 기준.
status: draft
updated: 2026-10-25
sources:
  - _bmad-output/01-product-brief.md
colors:
  ink: '#0F2A2B'
  ink-2: '#224142'
  muted: '#536D6D'
  cream: '#F7F2EA'
  sand: '#EFE6D8'
  surface: '#FFFFFF'
  accent: '#C86E42'
  on-ink: '#F7F2EA'
  on-ink-muted: '#BFD0C8'
  line: 'rgba(15, 42, 43, 0.10)'
typography:
  hero:
    fontFamily: 'Noto Sans KR'
    fontSize: 'clamp(32px, 6vw, 60px)'
    fontWeight: 800
    lineHeight: 1.18
    letterSpacing: '-0.02em'
  section-title:
    fontFamily: 'Noto Sans KR'
    fontSize: 'clamp(26px, 3.6vw, 38px)'
    fontWeight: 800
    lineHeight: 1.25
  card-title:
    fontFamily: 'Noto Sans KR'
    fontSize: 24px
    fontWeight: 700
    lineHeight: 1.3
  lead:
    fontFamily: 'Noto Sans KR'
    fontSize: 'clamp(17px, 2vw, 20px)'
    fontWeight: 400
    lineHeight: 1.6
  body:
    fontFamily: 'Noto Sans KR'
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.6
  eyebrow:
    fontFamily: 'Noto Sans KR'
    fontSize: 13px
    fontWeight: 700
  product-name:
    fontFamily: 'Space Grotesk'
    fontSize: 18px
    fontWeight: 700
rounded:
  sm: 6px
  md: 10px
  lg: 14px
  xl: 16px
spacing:
  gutter-mobile: 16px
  gutter-desktop: 32px
  section-mobile: 72px
  section-desktop: 104px
  hero-desktop: 112px
  card-padding: 28px
  grid-gap: 20px
  max-width: 1120px
components:
  button-primary:
    background: '{colors.accent}'
    text: '#FFFFFF'
    rounded: '{rounded.md}'
    padding: '14px 22px'
  link-arrow:
    text: 'currentColor'
    underline: '2px solid currentColor'
  offer-card:
    background: '{colors.ink}'
    text: '{colors.on-ink}'
    rounded: '{rounded.xl}'
    padding: '{spacing.card-padding}'
  flow-step:
    background: '{colors.surface}'
    border: '{colors.line}'
  flow-step-human:
    background: '{colors.ink}'
    text: '{colors.on-ink}'
  scenario-item:
    borderTop: '3px solid {colors.ink}'
---

# AINSOFT Website — Design Spine

→ 시각 기준 시안: [`.working/home-direction-v2.html`](.working/home-direction-v2.html). 이 문서와 시안이 다르면 이 문서를 따릅니다.

## Brand & Style

차분하고 단단한 B2B 톤입니다. "많이 보여주기"보다 **한 화면에 한 메시지**를 원칙으로 합니다. 장식(그림자, 카드 안의 카드, 칩 나열)을 걷어내고 큰 제목, 넉넉한 여백, 짧은 문장으로 신뢰감을 만듭니다. 기존 팔레트(짙은 청록과 크림)는 유지해 브랜드 연속성을 지킵니다.

## Colors

- `{colors.ink}`: 제목, 본문 강조, 어두운 카드 배경. 페이지의 기본 무게중심입니다.
- `{colors.cream}`: 페이지 기본 배경입니다. `{colors.surface}`(흰색)와 섹션 단위로 번갈아 써서 구획을 나눕니다. 테두리 박스로 섹션을 감싸지 않습니다.
- `{colors.accent}`: **도입 상담 버튼 전용**입니다. 라벨, 배지, 배너 배경, 카드 라벨에는 쓰지 않습니다. 이 색이 보이면 곧 "누를 곳"이라는 신호가 되어야 합니다.
- `{colors.muted}` / `{colors.on-ink-muted}`: 보조 설명과 분류 라벨에 씁니다.
- `{colors.sand}`: 흐름 그림의 담당 제품 태그처럼 작은 보조 표시에만 씁니다.

## Typography

- 한글 본문과 제목은 Noto Sans KR 하나로 통일합니다. 줄바꿈은 단어 단위(`keep-all`)로 합니다.
- Space Grotesk는 **제품명(AISOpsFlow, Ainsoft RAG)과 숫자**에만 씁니다. 섹션 라벨(Positioning 같은 영문 대문자 라벨)은 없앱니다.
- 위계는 `{typography.hero}` → `{typography.section-title}` → `{typography.card-title}` → `{typography.body}` 네 단계만 씁니다.

## Layout & Spacing

- 본문 최대 너비는 `{spacing.max-width}`이고, 좌우 여백은 모바일 `{spacing.gutter-mobile}`, 데스크톱 `{spacing.gutter-desktop}`입니다.
- 섹션 사이 여백은 모바일 `{spacing.section-mobile}`, 데스크톱 `{spacing.section-desktop}`입니다. 여백이 섹션을 구분하므로 섹션을 박스로 감싸지 않습니다.
- 그리드: 제공 항목 2열(같은 너비), 적용 장면 3열, 흐름 그림 5단 가로 배치입니다. 브레이크포인트는 앱 설정(600 / 1024px)을 따릅니다.
- 섹션 배경은 cream과 surface를 번갈아 씁니다. 마지막 상담 섹션은 바로 아래 푸터가 어두운 색이라 surface(흰색)로 둡니다.

## Elevation & Depth

그림자를 쓰지 않습니다. 깊이는 배경색 대비(`cream` / `surface` / `ink`)로만 표현합니다.

## Shapes

모서리는 버튼 `{rounded.md}`, 카드 `{rounded.xl}`로 제한합니다. 히어로 전체를 둥근 박스로 감싸는 방식(기존 36px)은 쓰지 않습니다. 알약(pill) 모양 칩은 쓰지 않습니다.

## Components

- **button-primary**: 강조색 배경에 흰 글자입니다. 페이지당 같은 행동("도입 상담") 하나에만 씁니다.
- **link-arrow**: 보조 이동("자세히 보기 →")은 버튼이 아니라 밑줄 텍스트 링크로 처리합니다.
- **offer-card**: 제품 카드와 구축 서비스 카드는 같은 크기, 같은 색, 같은 구조(분류 → 제목 → 한 줄 설명 → 세부 항목 2개 → 한 줄 보충 → 링크)입니다.
- **flow-step**: 흰 바탕에 번호, 단계명, 한 줄 설명, 담당 태그로 구성합니다. 사람이 하는 단계(승인)만 `flow-step-human`으로 반전시킵니다.
- **scenario-item**: 위쪽 굵은 선, 대상(분류 표시 포함), 제목, "전/후" 두 줄로 구성합니다.

## Do's and Don'ts

| Do | Don't |
|---|---|
| 섹션마다 제목 하나, 부제 한 줄 | 섹션마다 라벨, 제목, 두 문장 설명, 카드 3장, 버튼을 같은 틀로 반복 |
| 강조색은 도입 상담 버튼에만 | 배지, 라벨, 배너에 강조색 사용 |
| 수치가 없으면 쓰지 않기 | 숫자 카드 모양에 질문 문구 넣기 |
| 기술 용어는 제품 상세 페이지로 | 홈에 Lucene, gRPC, Spring Boot 노출 |
| 카드 한 겹 | 카드 안에 패널, 패널 안에 카드 |
