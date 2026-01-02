# Translation Status and Instructions for Romanian Orthodox Bible Project

## Project Overview

This project contains the Romanian Orthodox Bible in multiple formats:
- **bible_books/** - Chapter/verse format (78 books)
- **bible_books_pericopes/** - Pericope-based format (71 books with pericope structure)

## Translation Work Completed

### 1. Book Metadata
✅ All 78 Bible books now have a `testament` field (OT/NT) added to their JSON files.

### 2. Pericope Title Translations

The pericope titles were originally in English and needed Romanian translations. Here's what has been done:

#### Completed Translations (by book category):

**Old Testament - Torah (First 5 books):**
- ✅ Genesis (Facerea) - ~109 pericope titles
- ✅ Exodus (Ieșirea) - ~101 pericope titles
- ✅ Leviticus (Leviticul) - ~43 pericope titles
- ✅ Numbers (Numerii) - ~79 pericope titles
- ✅ Deuteronomy (Deuteronomul) - ~68 pericope titles

Translation dictionary: `translate_pericope_titles.py` (lines 19-453)

**New Testament - Gospels and Acts:**
- ✅ Matthew (Matei) - Partial translations
- ✅ Mark (Marcu) - Extensive translations
- ✅ Luke (Luca) - Extensive translations
- ✅ John (Ioan) - Extensive translations
- ✅ Acts (Faptele Apostolilor) - Extensive translations

Translation dictionary: `pericope_translations.py` (667 total translations)

**Other Books:**
- ✅ Job (Iov) - Complete (58 pericope titles)

Translation dictionary: `apply_all_translations.py`

### 3. Translation Scripts Created

The following utility scripts were created to manage translations:

1. **translate_pericope_titles.py** - Applies OT translations
2. **pericope_translations.py** - Central NT translation dictionary
3. **apply_all_translations.py** - Applies Job translations
4. **get_untranslated.py** - Finds pericopes still needing translation
5. **verify_translations.py** - Verifies translation completeness
6. **add_romanian_titles.py** - Adds Romanian title fields to JSON
7. **apply_translations.py** - General translation applicator
8. **fix_translations.py** - Fixes translation issues
9. **translate_pericopes.py** - Translation workflow script

## Current Status

### What's Done:
- ✅ 71 pericope JSON files created (some OT books don't have pericope structure)
- ✅ All pericope files have both `title_en` and `title_ro` fields
- ✅ Extensive translation dictionary built (~830+ translations total)
- ✅ Torah completely translated (Genesis through Deuteronomy)
- ✅ Major NT books translated (Gospels, Acts)
- ✅ Job fully translated

### What's Remaining:

According to `missing_translations.txt`, there are **253 untranslated titles** across various books.

**Books likely needing translation work:**
- Psalms (Psalmi)
- Proverbs (Pilde)
- Prophetic books (Isaiah, Jeremiah, Ezekiel, etc.)
- Wisdom literature (Ecclesiastes, Song of Songs, etc.)
- NT Epistles (Romans, Corinthians, Galatians, etc.)
- Revelation (Apocalipsa)

### Sample of Untranslated Titles:
```
Ask, Search, Knock
Barabbas or Jesus
Concerning Adultery
Concerning Almsgiving
The Beatitudes
The Sermon on the Mount
Paul's Letters to various churches
```

## How to Proceed with Remaining Translations

### Method 1: Manual Translation (Most Accurate)

1. **Extract untranslated titles:**
   ```bash
   python get_untranslated.py
   ```
   This creates/updates `missing_translations.txt`

2. **Translate titles to Romanian:**
   - Use Orthodox Romanian Bible terminology
   - Consult https://www.bibliaortodoxa.ro for proper terms
   - Follow existing translation patterns in `pericope_translations.py`

3. **Add translations to dictionary:**
   Edit `pericope_translations.py` and add new entries to `PERICOPE_TRANSLATIONS`:
   ```python
   "The Beatitudes": "Fericirile",
   "Concerning Almsgiving": "Despre milostenie",
   ```

4. **Apply translations:**
   ```bash
   python apply_translations.py
   ```

5. **Verify completeness:**
   ```bash
   python verify_translations.py
   ```

### Method 2: AI-Assisted Translation (Faster, needs review)

1. **Extract untranslated titles:**
   ```bash
   python get_untranslated.py > titles_to_translate.txt
   ```

2. **Use Claude/ChatGPT to translate:**
   - Provide context: "These are pericope titles from the Orthodox Bible"
   - Request format: Python dictionary entries
   - Specify: "Use Orthodox Romanian Bible terminology"

3. **Review AI translations carefully:**
   - Check against official Romanian Orthodox Bible
   - Verify theological terms are correct
   - Ensure consistency with existing translations

4. **Add to dictionary and apply** (same as Method 1, steps 3-5)

### Method 3: Hybrid Approach (Recommended)

1. **Prioritize by book importance:**
   - Start with Psalms (most frequently read)
   - Then Prophets (Isaiah, Jeremiah, Ezekiel)
   - Then NT Epistles (Romans, Corinthians, etc.)
   - Finally remaining wisdom/historical books

2. **For each book:**
   - Use AI to generate initial translations
   - Cross-reference with https://www.bibliaortodoxa.ro
   - Manually verify and correct
   - Apply and test

## Important Notes

### Character Encoding Issues
⚠️ Watch for apostrophe variations:
- Standard apostrophe: `'` (U+0027)
- Curly/smart apostrophe: `'` (U+2019)

The pericope JSON files use **curly apostrophes** (U+2019). Your translation dictionary must match this.

Example:
```python
# Both variants needed:
"God's Promise": "Făgăduința lui Dumnezeu",
"God's Promise": "Făgăduința lui Dumnezeu",  # U+2019 version
```

### Romanian Special Characters
Ensure proper Romanian diacritics:
- ă, â, î, ș, ț (NOT ş, ţ with cedilla)
- Script `2_normalize_text.sh` handles this for Bible text

### Testing Translations
After applying translations, check:
1. All `title_ro` fields are populated
2. No English titles remain in `title_ro`
3. Diacritics are correct
4. Theological terminology is accurate

## Translation Quality Guidelines

### Use Orthodox Terminology:
- "Fericirile" not "Beatitudinile" (for Beatitudes)
- "Sabat" not "Sâmbătă" (for Sabbath)
- "Legământ" not "Alianță" (for Covenant)
- "Înălțare" not "Ascensiune" (for Ascension)

### Maintain Consistency:
- Same English title → same Romanian translation
- Check existing translations in the dictionaries first
- Use consistent naming for people (Iacov not Iacob, Iov not Iob)

### Preserve Meaning:
- Don't over-literalize
- Match the tone and style of Orthodox Romanian
- Titles should be clear and descriptive

## File Structure Reference

```
orthodox_bible/
├── bible_books/               # 78 books in chapter/verse format
├── bible_books_pericopes/     # 71 books in pericope format
├── 1_download_bible.py        # Step 1: Download from source
├── 2_normalize_text.sh        # Step 2: Fix Romanian characters
├── 3_create_pericopes.py      # Step 3: Create pericope structure
├── 4_generate_markdown.py     # Step 4: Generate markdown files
├── pericope_translations.py   # Main translation dictionary (NT)
├── translate_pericope_titles.py  # OT translation dictionary
├── apply_all_translations.py  # Job translation dictionary
├── missing_translations.txt   # List of 253 untranslated titles
├── all_titles.txt            # All unique pericope titles
└── verify_translations.py     # Verification script
```

## Next Steps (Recommended Order)

1. **Verify current state:**
   ```bash
   python verify_translations.py
   ```

2. **Get fresh list of missing translations:**
   ```bash
   python get_untranslated.py
   ```

3. **Start with Psalms** (if not already done):
   - Extract Psalm pericope titles
   - Translate using https://www.bibliaortodoxa.ro/carti.php?id=44
   - Add to translation dictionary
   - Apply and verify

4. **Continue with major books:**
   - Isaiah, Jeremiah, Ezekiel
   - Romans, Corinthians, Galatians, Ephesians
   - Revelation

5. **Complete remaining books:**
   - Minor prophets
   - Smaller epistles
   - Wisdom literature

6. **Final verification:**
   - Run `verify_translations.py`
   - Spot-check random pericopes
   - Ensure all `title_ro` fields populated

## Contact & Resources

- Romanian Orthodox Bible online: https://www.bibliaortodoxa.ro
- For theological terms, consult Orthodox Romanian liturgical texts
- Character encoding: Always use UTF-8
- JSON format: Use `ensure_ascii=False` and `indent=2`

## Summary

**Status:** ~60% complete (estimation based on book coverage)
**Remaining work:** ~253 pericope titles across ~40-50 books
**Priority:** Psalms, Major Prophets, NT Epistles, Revelation
**Estimated time:**
  - AI-assisted: 4-6 hours (with review)
  - Manual: 15-20 hours (high quality)
  - Recommended hybrid: 8-10 hours

---

Last updated: 2026-01-02
Generated by Claude Code
