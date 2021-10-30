#!/bin/bash
# make pre donuts
if which pandoc > /dev/null; then
    echo "pandoc found..."
    if which wkhtmltopdf > /dev/null; then
        echo "wkhtmltopdf found... converting now to output.pdf"
        markdowndoc=$1
        echo $markdowndoc
        pandoc -f markdown -t $markdowndoc -o output.pdf
        echo "enjoy"
        exit 0
    else
        brew install pandoc
        brew install wkhtmltopdf --cask
    fi
else
    brew install pandoc
    brew install wkhtmltopdf --cask
fi
echo "pandoc and wkhtmltopdf now installed... converting now to output.pdf"
markdowndoc=$1
echo $markdowndoc
pandoc -f markdown -t $markdowndoc -o output.pdf
echo "enjoy"
exit 0


