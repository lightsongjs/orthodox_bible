# Romanian Orthodox Bible - Complete JSON Dataset

## Overview

This repository contains the complete Romanian Orthodox Bible (Biblia Ortodoxă Română) downloaded from [BibliaOrtodoxa.ro](https://www.bibliaortodoxa.ro/) and converted to structured JSON format.

## Statistics

- **Total Books**: 78
  - Old Testament: 50 books
  - New Testament: 27 books
  - Deuterocanonical books: Included
- **Total Chapters**: 1,345
- **Download Success Rate**: 100%
- **Total Size**: 7.2 MB

## Structure

### Files

- `bible_books_metadata.json` - Complete metadata for all books including:
  - Book ID
  - English name
  - Romanian name
  - Chapter count
  - Source URL

- `bible_books/` - Directory containing 78 JSON files, one per book:
  - Files are numbered sequentially: `01_Genesis.json` to `78_Revelation.json`
  - Each file contains all chapters for that book
  - Each chapter contains all verses with full text
  - All text is in Romanian

### Data Format

Each book file follows this structure:

```json
{
  "id": 25,
  "book_number": 1,
  "name_en": "Genesis",
  "name_ro": "Facerea",
  "chapter_count": 50,
  "url": "https://www.bibliaortodoxa.ro/carte.php?id=25",
  "chapters": [
    {
      "chapter": 1,
      "verses": [
        {
          "verse": 1,
          "text": "La început a făcut Dumnezeu cerul şi pământul."
        },
        ...
      ],
      "url": "https://www.bibliaortodoxa.ro/carte.php?id=25&cap=1"
    },
    ...
  ]
}
```

**Fields:**
- `id`: Original BibliaOrtodoxa.ro book ID
- `book_number`: Sequential book number (1=Genesis to 78=Revelation)
- `name_en`: English book name
- `name_ro`: Romanian book name
- `chapter_count`: Total number of chapters in the book
- `url`: Source URL for the book
- `chapters`: Array of all chapters with verses

## Books Included

### Old Testament (Vechiul Testament)

1. Genesis (Facerea) - 50 chapters
2. Exodus (Ieșirea) - 40 chapters
3. Leviticus (Leviticul) - 27 chapters
4. Numbers (Numerii) - 36 chapters
5. Deuteronomy (Deuteronomul) - 34 chapters
6. Joshua (Iosua Navi) - 24 chapters
7. Judges (Judecători) - 21 chapters
8. Ruth (Rut) - 4 chapters
9-12. 1-4 Kings (I-IV Regi) - 31, 24, 22, 25 chapters
13-14. 1-2 Chronicles (I-II Paralipomena) - 29, 36 chapters
15. 1 Ezra (I Ezdra) - 10 chapters
16. Nehemiah (Neemia) - 13 chapters
17. Esther (Esterei) - 10 chapters
18. Job (Iov) - 42 chapters
19. Psalms (Psalmi) - 151 chapters
20. Proverbs (Pilde) - 31 chapters
21. Ecclesiastes (Ecclesiastul) - 12 chapters
22. Song of Songs (Cântări) - 8 chapters
23. Isaiah (Isaia) - 66 chapters
24. Jeremiah (Ieremia) - 52 chapters
25. Lamentations (Plangeri) - 5 chapters
26. Ezekiel (Iezechiel) - 48 chapters
27. Daniel - 12 chapters
28-39. Minor Prophets - various chapters
40-50. Deuterocanonical books including Tobit, Judith, Maccabees, etc.

### New Testament (Noul Testament)

1. Matthew (Matei) - 28 chapters
2. Mark (Marcu) - 16 chapters
3. Luke (Luca) - 24 chapters
4. John (Ioan) - 21 chapters
5. Acts (Faptele Apostolilor) - 28 chapters
6. Romans (Romani) - 16 chapters
7-27. Epistles and Revelation - various chapters

## Scripts

### Main Scripts

1. **`download_bible_chapters.py`** - Downloads all chapters from BibliaOrtodoxa.ro
   - Automatically adds `book_number` and `chapter_count` fields
   - Saves files with proper naming: `##_RomanianName.json`
   - Creates complete JSON files in `bible_books/` directory

2. **`normalize_bible_books.sh`** - Normalizes Romanian special characters
   - Converts Romanian diacritics (ă→a, ș→s, ț→t, etc.)
   - Creates `bible_books_normalized/` directory
   - Useful for text search and processing

3. **`verify_completeness.py`** - Verifies data completeness
   - Checks all 78 books are present
   - Verifies all chapters are downloaded
   - Ensures all chapters contain verses

## Usage

### Starting from Zero

To download all Bible books from scratch:
```bash
# 1. Download all chapters (takes ~15 minutes)
python3 download_bible_chapters.py

# 2. Normalize Romanian characters (optional, for better search)
./normalize_bible_books.sh

# 3. Verify everything downloaded correctly
python3 verify_completeness.py
```

### Re-downloading

To re-download all data:
```bash
# Remove existing data
rm -rf bible_books/ bible_books_normalized/

# Download fresh copy
python3 download_bible_chapters.py

# Normalize if needed
./normalize_bible_books.sh
```

### Verify Existing Data

To verify data completeness:
```bash
python3 verify_completeness.py
```

## Notes

- All text is in Romanian
- Based on the Romanian Orthodox Bible translation
- Includes deuterocanonical books (part of the Orthodox canon)
- Psalms numbered 1-151 (includes Psalm 151 from the Septuagint)
- Preserves original verse numbering and text formatting

## Source

All content downloaded from: https://www.bibliaortodoxa.ro/

## License

The scripture text belongs to the Romanian Orthodox Church. This is a data formatting project for educational and research purposes.

---

Generated: 2025-11-20
