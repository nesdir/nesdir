#!/bin/bash
xsltproc nesdir-games.xsl cartdb.xml
xsltproc nesdir-mappers.xsl cartdb.xml
xsltproc nesdir-toc.xsl cartdb.xml
cp nesdir.css output/
cp nesdir-small.png output/
