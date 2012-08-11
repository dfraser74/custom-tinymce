#!/bin/bash

#This is the official script used for importing of TinyMCE snapshot with customisations into Moodle
#maintained by Petr Skoda

#edit following to match your git checkouts
SOURCEDIR=/Users/skodak/server/workspace/custom-tinymce
TARGETDIR=/Users/skodak/server/workspace/moodle23/lib/editor/tinymce/tiny_mce/3.6.0


#first build the tinymce project
cd $SOURCEDIR
ant



#now copy to our new moodle subdirectory for this tinymce version
mkdir $TARGETDIR
cp $SOURCEDIR/jscripts/tiny_mce/*.* $TARGETDIR/
cp -R $SOURCEDIR/jscripts/tiny_mce/langs $TARGETDIR/
cp -R $SOURCEDIR/jscripts/tiny_mce/plugins $TARGETDIR/
cp -R $SOURCEDIR/jscripts/tiny_mce/themes $TARGETDIR/
cp -R $SOURCEDIR/jscripts/tiny_mce/utils $TARGETDIR/
cp -R $SOURCEDIR/jscripts/tiny_mce/classes/Popup.js $TARGETDIR/tiny_mce_popup_src.js


# undo git changes - it would be great if upstream use the same process for tiny_mce_popup.js
cd $SOURCEDIR/jscripts/tiny_mce
git checkout tiny_mce_popup.js



#NOTE: fix all line endings to match Moodle coding style rules!!!!!
