/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.skins.add("v2",function(){return{editor:{css:["editor.css"]},dialog:{css:["dialog.css"]},separator:{canGroup:!1},templates:{css:["templates.css"]},margins:[0,14,18,14]}}()),function(){function t(){CKEDITOR.dialog.on("resize",function(t){var i=t.data,e=i.width,s=i.height,d=i.dialog,a=d.parts.contents;"v2"==i.skin&&(a.setStyles({width:e+"px",height:s+"px"}),CKEDITOR.env.ie&&!CKEDITOR.env.ie9Compat&&setTimeout(function(){var t=d.parts.dialog.getChild([0,0,0]),i=t.getChild(0),e=i.getSize("width");s+=i.getChild(0).getSize("height")+1;var a=t.getChild(2);a.setSize("width",e),a=t.getChild(7),a.setSize("width",e-28),a=t.getChild(4),a.setSize("height",s),a=t.getChild(5),a.setSize("height",s)},100))})}CKEDITOR.dialog?t():CKEDITOR.on("dialogPluginReady",t)}();