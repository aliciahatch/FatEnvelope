/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.plugins.add("docprops",{init:function(o){var d=new CKEDITOR.dialogCommand("docProps");d.modes={wysiwyg:o.config.fullPage},o.addCommand("docProps",d),CKEDITOR.dialog.add("docProps",this.path+"dialogs/docprops.js"),o.ui.addButton("DocProps",{label:o.lang.docprops.label,command:"docProps"})}});