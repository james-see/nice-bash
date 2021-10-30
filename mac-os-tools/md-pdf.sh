#!/bin/bash
# make pre donuts

if which pandoc > /dev/null; then
    echo "pandoc found..."
    if which wkhtmltopdf > /dev/null; then
        echo "wkhtmltopdf found... converting now to output.pdf"
        markdowndoc=$1
        echo $markdowndoc
        pandoc $markdowndoc -t pdf -o output.pdf --verbose --pdf-engine=/Library/TeX/texbin/pdflatex
        echo "enjoy"
        exit 0
    else
        brew install pandoc
        brew install wkhtmltopdf --cask
        brew install librsvg python homebrew/cask/basictex
    fi
else
    brew install pandoc
    brew install wkhtmltopdf --cask
    brew install librsvg python homebrew/cask/basictex
fi
echo "pandoc and wkhtmltopdf now installed... converting now to output.pdf"
markdowndoc=$1
echo $markdowndoc
pandoc $markdowndoc -t pdf -o output.pdf --verbose --pdf-engine=/Library/TeX/texbin/pdflatex
echo "enjoy"
exit 0


