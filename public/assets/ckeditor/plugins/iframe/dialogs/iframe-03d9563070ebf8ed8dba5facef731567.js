/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
!function(){function e(e){var t=this,a=t instanceof CKEDITOR.ui.dialog.checkbox;if(e.hasAttribute(t.id)){var l=e.getAttribute(t.id);a?t.setValue(i[t.id]["true"]==l.toLowerCase()):t.setValue(l)}}function t(e){var t=this,a=""===t.getValue(),l=t instanceof CKEDITOR.ui.dialog.checkbox,n=t.getValue();a?e.removeAttribute(t.att||t.id):l?e.setAttribute(t.id,i[t.id][n]):e.setAttribute(t.att||t.id,n)}var i={scrolling:{"true":"yes","false":"no"},frameborder:{"true":"1","false":"0"}};CKEDITOR.dialog.add("iframe",function(i){var a=i.lang.iframe,l=i.lang.common,n=i.plugins.dialogadvtab;return{title:a.title,minWidth:350,minHeight:260,onShow:function(){var e=this;e.fakeImage=e.iframeNode=null;var t=e.getSelectedElement();if(t&&t.data("cke-real-element-type")&&"iframe"==t.data("cke-real-element-type")){e.fakeImage=t;var a=i.restoreRealElement(t);e.iframeNode=a,e.setupContent(a)}},onOk:function(){var e,t=this;e=t.fakeImage?t.iframeNode:new CKEDITOR.dom.element("iframe");var a={},l={};t.commitContent(e,a,l);var n=i.createFakeElement(e,"cke_iframe","iframe",!0);n.setAttributes(l),n.setStyles(a),t.fakeImage?(n.replace(t.fakeImage),i.getSelection().selectElement(n)):i.insertElement(n)},contents:[{id:"info",label:l.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{id:"src",type:"text",label:l.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(a.noUrl),setup:e,commit:t}]},{type:"hbox",children:[{id:"width",type:"text",style:"width:100%",labelLayout:"vertical",label:l.width,validate:CKEDITOR.dialog.validate.htmlLength(l.invalidHtmlLength.replace("%1",l.width)),setup:e,commit:t},{id:"height",type:"text",style:"width:100%",labelLayout:"vertical",label:l.height,validate:CKEDITOR.dialog.validate.htmlLength(l.invalidHtmlLength.replace("%1",l.height)),setup:e,commit:t},{id:"align",type:"select","default":"",items:[[l.notSet,""],[l.alignLeft,"left"],[l.alignRight,"right"],[l.alignTop,"top"],[l.alignMiddle,"middle"],[l.alignBottom,"bottom"]],style:"width:100%",labelLayout:"vertical",label:l.align,setup:function(t,i){if(e.apply(this,arguments),i){var a=i.getAttribute("align");this.setValue(a&&a.toLowerCase()||"")}},commit:function(e,i,a){t.apply(this,arguments),this.getValue()&&(a.align=this.getValue())}}]},{type:"hbox",widths:["50%","50%"],children:[{id:"scrolling",type:"checkbox",label:a.scrolling,setup:e,commit:t},{id:"frameborder",type:"checkbox",label:a.border,setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"name",type:"text",label:l.name,setup:e,commit:t},{id:"title",type:"text",label:l.advisoryTitle,setup:e,commit:t}]},{id:"longdesc",type:"text",label:l.longDescr,setup:e,commit:t}]},n&&n.createAdvancedTab(i,{id:1,classes:1,styles:1})]}})}();