/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
!function(){function e(e){return CKEDITOR.env.ie?e.$.clientWidth:parseInt(e.getComputedStyle("width"),10)}function t(e,t){var n=e.getComputedStyle("border-"+t+"-width"),o={thin:"0px",medium:"1px",thick:"2px"};return n.indexOf("px")<0&&(n=n in o&&"none"!=e.getComputedStyle("border-style")?o[n]:0),parseInt(n,10)}function n(e){for(var t,n,o,i=e.$.rows,a=0,r=0,l=i.length;l>r;r++)o=i[r],t=o.cells.length,t>a&&(a=t,n=o);return n}function o(e){for(var o=[],i=-1,a="rtl"==e.getComputedStyle("direction"),r=n(e),l=new CKEDITOR.dom.element(e.$.tBodies[0]),s=l.getDocumentPosition(),u=0,d=r.cells.length;d>u;u++){var m=new CKEDITOR.dom.element(r.cells[u]),c=r.cells[u+1]&&new CKEDITOR.dom.element(r.cells[u+1]);i+=m.$.colSpan||1;var f,h,g,v=m.getDocumentPosition().x;a?h=v+t(m,"left"):f=v+m.$.offsetWidth-t(m,"right"),c?(v=c.getDocumentPosition().x,a?f=v+c.$.offsetWidth-t(c,"right"):h=v+t(c,"left")):(v=e.getDocumentPosition().x,a?f=v:h=v+e.$.offsetWidth),g=Math.max(h-f,3),o.push({table:e,index:i,x:f,y:s.y,width:g,height:l.$.offsetHeight,rtl:a})}return o}function i(e,t){for(var n=0,o=e.length;o>n;n++){var i=e[n];if(t>=i.x&&t<=i.x+i.width)return i}return null}function a(e){(e.data||e).preventDefault()}function r(n){function o(){f=null,y=0,v=0,h.removeListener("mouseup",m),g.removeListener("mousedown",d),g.removeListener("mousemove",c),h.getBody().setStyle("cursor","auto"),u?g.remove():g.hide()}function i(){for(var t=f.index,n=CKEDITOR.tools.buildTableMap(f.table),o=[],i=[],r=Number.MAX_VALUE,l=r,s=f.rtl,u=0,d=n.length;d>u;u++){var m=n[u],T=m[t+(s?1:0)],w=m[t+(s?0:1)];T=T&&new CKEDITOR.dom.element(T),w=w&&new CKEDITOR.dom.element(w),T&&w&&T.equals(w)||(T&&(r=Math.min(r,e(T))),w&&(l=Math.min(l,e(w))),o.push(T),i.push(w))}b=o,D=i,C=f.x-r,x=f.x+l,g.setOpacity(.5),p=parseInt(g.getStyle("left"),10),y=0,v=1,g.on("mousemove",c),h.on("dragstart",a)}function r(){v=0,g.setOpacity(0),y&&l();var e=f.table;setTimeout(function(){e.removeCustomData("_cke_table_pillars")},0),h.removeListener("dragstart",a)}function l(){for(var n=f.rtl,o=n?D.length:b.length,i=0;o>i;i++){var a=b[i],r=D[i],l=f.table;CKEDITOR.tools.setTimeout(function(e,t,o,i,a,r){e&&e.setStyle("width",s(Math.max(t+r,0))),o&&o.setStyle("width",s(Math.max(i-r,0))),a&&l.setStyle("width",s(a+r*(n?-1:1)))},0,this,[a,a&&e(a),r,r&&e(r),(!a||!r)&&e(l)+t(l,"left")+t(l,"right"),y])}}function d(e){a(e),i(),h.on("mouseup",m,this)}function m(e){e.removeListener(),r()}function c(e){T(e.data.$.clientX)}var f,h,g,v,p,y,b,D,C,x;h=n.document,g=CKEDITOR.dom.element.createFromHtml('<div data-cke-temp=1 contenteditable=false unselectable=on style="position:absolute;cursor:col-resize;filter:alpha(opacity=0);opacity:0;padding:0;background-color:#004;background-image:none;border:0px none;z-index:10"></div>',h),u||h.getDocumentElement().append(g),this.attachTo=function(e){v||(u&&(h.getBody().append(g),y=0),f=e,g.setStyles({width:s(e.width),height:s(e.height),left:s(e.x),top:s(e.y)}),u&&g.setOpacity(.25),g.on("mousedown",d,this),h.getBody().setStyle("cursor","col-resize"),g.show())};var T=this.move=function(e){if(!f)return 0;if(!v&&(e<f.x||e>f.x+f.width))return o(),0;var t=e-Math.round(g.$.offsetWidth/2);if(v){if(t==C||t==x)return 1;t=Math.max(t,C),t=Math.min(t,x),y=t-p}return g.setStyle("left",s(t)),1}}function l(e){var t=e.data.getTarget();if("mouseout"==e.name){if(!t.is("table"))return;for(var n=new CKEDITOR.dom.element(e.data.$.relatedTarget||e.data.$.toElement);n&&n.$&&!n.equals(t)&&!n.is("body");)n=n.getParent();if(!n||n.equals(t))return}t.getAscendant("table",1).removeCustomData("_cke_table_pillars"),e.removeListener()}var s=CKEDITOR.tools.cssLength,u=CKEDITOR.env.ie&&(CKEDITOR.env.ie7Compat||CKEDITOR.env.quirks||CKEDITOR.env.version<7);CKEDITOR.plugins.add("tableresize",{requires:["tabletools"],init:function(e){e.on("contentDom",function(){var t;e.document.getBody().on("mousemove",function(n){if(n=n.data,t&&t.move(n.$.clientX))return a(n),void 0;var s,u,d=n.getTarget();if(d.is("table")||d.getAscendant("tbody",1)){s=d.getAscendant("table",1),(u=s.getCustomData("_cke_table_pillars"))||(s.setCustomData("_cke_table_pillars",u=o(s)),s.on("mouseout",l),s.on("mousedown",l));var m=i(u,n.$.clientX);m&&(!t&&(t=new r(e)),t.attachTo(m))}})})}})}();