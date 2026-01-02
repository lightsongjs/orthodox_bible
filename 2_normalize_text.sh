#!/bin/bash
# Script to normalize Romanian special characters in Bible books for better search functionality

set -e  # Exit on error

SOURCE_DIR="bible_books"
TARGET_DIR="bible_books_normalized"

echo "=========================================="
echo "Romanian Bible Books Normalization Script"
echo "=========================================="
echo ""

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Error: Source directory '$SOURCE_DIR' not found!"
    exit 1
fi

# Check if target directory exists
if [ -d "$TARGET_DIR" ]; then
    echo "📁 Target directory '$TARGET_DIR' already exists."
    read -p "Do you want to overwrite it? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Removing existing directory..."
        rm -rf "$TARGET_DIR"
    else
        echo "❌ Aborted by user."
        exit 0
    fi
fi

# Create target directory
echo "📁 Creating directory: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo ""
echo "🔄 Normalizing files..."
echo ""

# Counter for processed files
count=0
total=$(find "$SOURCE_DIR" -name "*.json" | wc -l)

# Process each JSON file
for file in "$SOURCE_DIR"/*.json; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        count=$((count + 1))

        echo "[$count/$total] Processing: $filename"

        # Normalize Romanian special characters using sed
        # Replace: ă→a, â→a, î→i, ș→s, ț→t, ş→s, ţ→t
        #          Ă→A, Â→A, Î→I, Ș→S, Ț→T, Ş→S, Ţ→T
        sed -e 's/ă/a/g' \
            -e 's/â/a/g' \
            -e 's/î/i/g' \
            -e 's/ș/s/g' \
            -e 's/ț/t/g' \
            -e 's/ş/s/g' \
            -e 's/ţ/t/g' \
            -e 's/Ă/A/g' \
            -e 's/Â/A/g' \
            -e 's/Î/I/g' \
            -e 's/Ș/S/g' \
            -e 's/Ț/T/g' \
            -e 's/Ş/S/g' \
            -e 's/Ţ/T/g' \
            "$file" > "$TARGET_DIR/$filename"
    fi
done

echo ""
echo "=========================================="
echo "✅ Normalization Complete!"
echo "=========================================="
echo ""
echo "📊 Statistics:"
echo "   Source directory: $SOURCE_DIR"
echo "   Target directory: $TARGET_DIR"
echo "   Files processed: $count"
echo "   Total size: $(du -sh "$TARGET_DIR" | cut -f1)"
echo ""
echo "📝 Special characters replaced:"
echo "   ă → a    Ă → A"
echo "   â → a    Â → A"
echo "   î → i    Î → I"
echo "   ș → s    Ș → S  (comma below)"
echo "   ț → t    Ț → T  (comma below)"
echo "   ş → s    Ş → S  (cedilla - old standard)"
echo "   ţ → t    Ţ → T  (cedilla - old standard)"
echo ""
echo "✨ You can now search the normalized files in: $TARGET_DIR"
