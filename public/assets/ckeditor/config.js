/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(e){e.filebrowserBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashUploadUrl="/ckeditor/attachment_files",e.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",e.filebrowserImageBrowseUrl="/ckeditor/pictures",e.filebrowserImageUploadUrl="/ckeditor/pictures",e.filebrowserUploadUrl="/ckeditor/attachment_files",e.filebrowserParams=function(){for(var e,t,r,a=document.getElementsByTagName("meta"),o=new Object,i=0;i<a.length;i++)switch(r=a[i],r.name){case"csrf-token":e=r.content;break;case"csrf-param":t=r.content;break;default:continue}return void 0!==t&&void 0!==e&&(o[t]=e),o},e.addQueryString=function(e,t){var r=[];if(!t)return e;for(var a in t)r.push(a+"="+encodeURIComponent(t[a]));return e+(-1!=e.indexOf("?")?"&":"?")+r.join("&")},CKEDITOR.on("dialogDefinition",function(t){var r,a,o=t.data.name,i=t.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],o)>-1&&(r=i.getContents("Upload")||i.getContents("upload"),a=null==r?null:r.get("upload"),a&&null==a.filebrowser.params&&(a.filebrowser.params=e.filebrowserParams(),a.action=e.addQueryString(a.action,a.filebrowser.params)))}),e.extraPlugins="embed,attachment",e.toolbar="Easy",e.toolbar_Easy=[["Source","-","Preview"],["Cut","Copy","Paste","PasteText","PasteFromWord"],["Undo","Redo","-","SelectAll","RemoveFormat"],["Styles","Format"],["Subscript","Superscript","TextColor"],["Maximize","-","About"],"/",["Bold","Italic","Underline","Strike"],["NumberedList","BulletedList","-","Outdent","Indent","Blockquote"],["JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"],["Link","Unlink","Anchor"],["Image","Attachment","Flash","Embed"],["Table","HorizontalRule","Smiley","SpecialChar","PageBreak"]]};