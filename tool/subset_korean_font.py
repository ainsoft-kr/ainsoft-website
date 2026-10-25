"""Regenerate the Korean font subset loaded before the first frame.

The subset keeps every glyph it already has and adds any Hangul syllable used
in lib/. The full font is not committed; restore it from git first:

    git show 'cc95526^:google_fonts/NotoSansKR[wght].ttf' > /tmp/NotoSansKR-full.ttf
    uv run --with fonttools python tool/subset_korean_font.py /tmp/NotoSansKR-full.ttf
"""

import pathlib
import sys

from fontTools import subset
from fontTools.ttLib import TTFont

SUBSET = pathlib.Path("google_fonts/NotoSansKR-critical[wght].ttf")


def hangul_in_lib():
    chars = set()
    for path in pathlib.Path("lib").rglob("*.dart"):
        chars.update(c for c in path.read_text() if "가" <= c <= "힣")
    return {ord(c) for c in chars}


def main(full_font):
    codes = set(TTFont(SUBSET).getBestCmap())
    before = len(codes)
    codes |= hangul_in_lib()
    print(f"glyphs {before} -> {len(codes)}")

    options = subset.Options()
    options.layout_features = ["*"]
    options.name_IDs = ["*"]
    options.notdef_outline = True
    options.drop_tables = []

    font = TTFont(full_font)
    subsetter = subset.Subsetter(options=options)
    subsetter.populate(unicodes=codes)
    subsetter.subset(font)
    font.save(SUBSET)


if __name__ == "__main__":
    main(sys.argv[1])
