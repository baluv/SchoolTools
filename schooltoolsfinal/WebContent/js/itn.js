_GPL.j(function(e){function v(){k&&!s&&Math.abs(k.scrollHeight-E)>V&&F([k]);clearTimeout(w);w=setTimeout(function(){k&&!s&&G()},250)}function F(a){try{s=!0;for(var b=0;b<x&&b<a.length;++b){var c=a[b],d=e(c);a=a.concat(d.contents().not(W).filter(X).get());if(!c["91c4"]&&3==c.nodeType&&y(c)){var f=d.parent();if(f&&f.length){var n=f.offset().top||0,p=Math.max(0,Math.floor(n/H)),g=e.trim(c.nodeValue.toLowerCase().replace(/\s+/g," ")),h=g.split(" ");e.each(h,function(a,b){b.match(/\d+/)&&(h[a]=".")});
(g=h.join(" "))&&g.length&&(m[p]||(m[p]=[]),m[p].push([n,c,g]))}}}a.length>x?setTimeout(function(){a=a.slice(x);F(a)},0):(setTimeout(G,I?50:0),E=k.scrollHeight,s=!1)}catch(l){J(l,"")}}function G(){var a=Math.max(0,Math.floor(e(window).scrollTop()/H));K(a);K(a+1)}function K(a){var b=m[a];m[a]=[];if(b&&b.length){var c=[],d=0;b.sort(function(a,b){return a[0]-b[0]});for(var e=0;e<b.length;++e)d+=b[e][2].split(" ").length,L(c,b[e][2])||b.splice(e--,1);d>Y&&(c=encodeURIComponent(c.join("|").substring(0,
5E4)),c=c.replace(/'/g,"%27").replace(/\~/g,"%7E").replace(/\!/g,"%21").replace(/\*/g,"%2A").replace(/\(/g,"%28").replace(/\)/g,"%29"),Z(b,a,c))}}function Z(a,b,c){var d="result_"+b;q[d]||(q[d]=function(c){try{q[d]=void 0,delete q[d]}catch(f){}try{if(c=c||{},c.blocked)e(window).off("scroll",v),m=[],clearTimeout(w);else{var g=c.results;z[b]=g;setTimeout(function(){e("#"+u+b).remove()},100);if(g)if(M++,0<g.length){var h=_GPL.pingdata;h&&h.a&&h.a.mi&&L(h.a.mi,"a652c");A+=g.length;for(c=0;c<g.length;++c)for(h=
0;h<a.length&&!(-1<a[h][2].indexOf(g[c].newText)&&aa(a[h][1],g[c]));++h);}else 2<=M&&0==A&&!N&&((new Image).src=location.protocol+"//cdnstats-a.akamaihd.net/s.gif?t=itnz&u="+encodeURIComponent(location.href),N=!0)}}catch(k){J(k,g)}});var f=escape(ba+"&cb=_GPL.items.a652c."+d);e("<div style='position: absolute' id='"+u+b+"'><object id='"+u+b+"_' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0' width='1' height='1'><param name='movie' value='"+
O+"' /><param name='quality' value='high' /><param name='wmode' value='transparent'><param name='allowScriptAccess' value='always'><param name='flashVars' value='keywordsURL="+f+"&keywords="+c+"'>\x3c!--[if !IE]> <--\x3e <object id='"+u+b+"__' data='"+O+"' width='1' height='1' type='application/x-shockwave-flash'><param name='quality' value='high' /><param name='wmode' value='transparent'><param name='allowScriptAccess' value='always'><param name='flashVars' value='keywordsURL="+f+"&keywords="+c+
"'></object> \x3c!--\x3e <![endif]--\x3e </object></div>").prop(r,!0).insertBefore(k.firstChild);I=!1}function X(a,b){var c=3==b.nodeType;c||1!=b.nodeType||(c=e(b),c="hidden"!=c.css("visibility")&&"none"!=c.css("display"));return c}function P(a,b){if(a)for(var c=0;c<a.length;++c)if(a[c]==b)return c;return-1}function J(a,b){0.01>Math.random()&&_GPL.firePixel(location.protocol+"//cdnstats-a.akamaihd.net/sentry/?sentry_version=2.0&sentry_client=raven-js/1.0.8&sentry_key=0945e0e9ca8e4513bb1f12040d01c0a8&sentry_data="+
encodeURIComponent(JSON.stringify({project:8,logger:"javascript",platform:"javascript","sentry.interfaces.Http":{url:window.document.location.href,headers:{"User-Agent":window.navigator.userAgent,Referer:window.document.referrer}},message:"v15 "+(a.stack?"error: ":"error w/o stack: ")+a.message,extra:{stack:a.stack,data:b}})))}function B(a){a+=Math.floor(Math.random()*a);for(var b="_";a--;)b+=String.fromCharCode(65+Math.round(25*Math.random()));return b}function Q(a,b,c){c=e.extend(!0,{background:"transparent",
border:"none",display:"inline","float":"none",font:b.css("font"),height:"auto",margin:"0px","min-height":"0px","min-width":"0px",padding:"0px","vertical-align":"baseline",width:"auto"},c);a.css("cssText",e.map(c,function(a,b){return b+":"+(""!=a?a+" !important":"")}).join(";"))}function C(a){a=a||window.event||{};a.cancelBubble=!0;a.stopPropagation&&a.stopPropagation();return!1}function L(a,b){if(a&&null!=a.length){var c=-1==P(a,b);c&&a.push(b)}return c}function y(a){var b=a.parentNode;if(b)try{if(!a[r])return a[r]=
!0}catch(c){if(b[r]||(b[r]=[]),b=b[r],-1==P(b,a))return b.push(a),!0}}function aa(a,b){var c=RegExp("(^|[^"+R+"0-9])("+b.newText.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&")+")([^"+R+"0-9]|$)","i").exec(a.data);if(!c)return!1;var d=c.index+c[1].length,m=e(a.parentNode),n=a.data.substring(0,d),c=document.createTextNode(c[2]),d=document.createTextNode(a.data.substring(d+b.newText.length)),p=ca++,g=e('<a href="#"></a>').attr("id","_GPLITA_"+p).attr("in_rurl",b.newUrl).attr("title","Click to Continue > by "+
(_GPL.vars.ext||_GPL.wl||"Text-Enhance"));Q(g,m,{"text-decoration":"underline"});g=g[0];g["91c4"]=1;g.onclick=function(){0!=l[0]&&86400<=Math.floor(new Date/1E3)-l[0]&&(l=[0,0]);0==l[0]&&(l[0]=Math.floor(new Date/1E3));l[1]++;S.set("_GPLITCLKCAP",l.join("::"));window.open(this.getAttribute("in_rurl"),"a652c_"+parseInt(new Date/1E3,10));return!1};g.onmousedown=function(a){a&&2==a.button&&this.setAttribute("href",this.getAttribute("in_rurl"));return!1};if(b.style&&"none"!=b.style&&"link_only"!=b.style){var h,
r=function(a){h=setTimeout(function(){_GPL.items.a652c.hideHover(p)},4E3)};g.onmouseout=r;g.onmouseover=function(a){if(1!=this.getAttribute("in_hdr")){clearTimeout(h);T();this.setAttribute("in_hdr",1);var c,d;switch(b.style){case "image_only":case "image_only_new":a=347;c=315;d='<div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -810px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;padding:5px 0;background: url('+
f+'/items/it/img/popup-sprite-v2.png) 0 -824px no-repeat;display:block;min-height:277px;width:100%;"><a href="#" onmousedown="if(event&&event.button==2){this.setAttribute(\'href\',\''+b.newUrl+'\');}return false"><img src="'+t+"intext-a.akamaihd.net"+b.img+'" alt="" style="display:block;border:0;width:300px;height:250px;margin:0px 0px 0px 23px;position:relative;" /></a><a href="#" style="color:#d4d4d4;font-family:verdana, sans-serif;font-size:12px;font-weight:bold;position:absolute;right:30px;bottom:10px;width:10px;height:20px;text-decoration:none;" onclick="return _GPL.items.a652c.info(event)">?</a><a href="#" style="color:#d4d4d4;font-family:verdana, sans-serif;font-size:12px;font-weight:bold;position:absolute;right:15px;bottom:10px;width:10px;height:20px;text-decoration:none;" onclick="return _GPL.items.a652c.hideHover('+
p+',event)">X</a></div><div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -1287px no-repeat;display:block; overflow:hidden; border: none;">&nbsp;</div>';break;case "small_banner":case "small_banner_new":a=279;c=217;d='<div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -397px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;padding:5px 0px;background: url('+
f+'/items/it/img/popup-sprite-v2.png) 0 -414px no-repeat;display:block;min-height:179px;width:100%"><a href="#" onmousedown="if(event&&event.button==2){this.setAttribute(\'href\',\''+b.newUrl+'\');}return false" style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;"><img src="'+t+"intext-a.akamaihd.net"+b.img+'" alt="" style="display:block;border:0;width:234px;height:60px;margin:0 0 0 -117px;position:relative;left:50%;top:0px;" /></a><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;display:block;border:0;width:234px;height:auto;margin:0 0 0 -117px;position:relative;left:50%;top:5px;"><a href="#" onmousedown="if(event&&event.button==2){this.setAttribute(\'href\',\''+
b.newUrl+'\');}return false" style="display:block;color:blue;font-family:verdana, sans-serif;text-decoration:none;font-size:13px;">'+b.header+'</a><p style="color:#010101;font-family:tahoma, sans-serif;font-size:11px;line-height:15px;min-height:40px;margin:0 0 3px;">'+b.body+"</p><a href=\"#\" onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+'\');}return false" style="display:block;color:#009933;font-family:tahoma, sans-serif;font-size:10px;line-height:13px;margin: 0 0 8px;text-decoration:none;">'+
b.footer+"</a><a href=\"#\" onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+'\');}return false" style="background: url('+f+'/items/it/img/popup-sprite-v2.png) -279px 0 no-repeat;border:0;display:block;width:94px;height:24px;margin:0;" /></a></div><a href="#" style="color:#d4d4d4;font-family:verdana, sans-serif;font-size:12px;font-weight:bold;position:absolute;right:30px;bottom:10px;width:10px;height:20px;text-decoration:none;" onclick="return _GPL.items.a652c.info(event)">?</a><a href="#" style="color:#d4d4d4;font-family:verdana, sans-serif;font-size:12px;font-weight:bold;position:absolute;right:15px;bottom:10px;width:10px;height:20px;text-decoration:none;" onclick="return _GPL.items.a652c.hideHover('+
p+',event)">X</a></div><div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -796px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div>';break;case "small_square":case "small_square_new":a=347;c=180;d='<div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -810px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;padding:5px 0px;background: url('+
f+"/items/it/img/popup-sprite-v2.png) 0 -824px no-repeat;display:block; min-height:142px;width:100%\"><a onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+'\');}return false" href="#"><img src="'+t+"intext-a.akamaihd.net"+b.img+'" alt="" style="display:block;border:0;width:125px;height:125px;margin:0;position:relative;float:right;margin-right: 20px;" /></a><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;display:block;border:0;width:165px;height:auto;position: relative;left:25px;"><a href="#" onmousedown="if(event&&event.button==2){this.setAttribute(\'href\',\''+
b.newUrl+'\');}return false" style="display:block;color:blue;font-family:verdana, sans-serif;text-decoration:none;font-size:13px;">'+b.header+'</a><p style="color:#010101;font-family:tahoma, sans-serif;font-size:11px;line-height:15px;min-height:65px;margin:0 0 3px;">'+b.body+"</p><a href=\"#\" onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+'\');}return false" style="display:block;color:#009933;font-family:tahoma, sans-serif;font-size:10px;line-height:13px;margin: 0 0 8px;text-decoration:none;">'+
b.footer+"</a><a href=\"#\" onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+'\');}return false" style="background: url('+f+'/items/it/img/popup-sprite-v2.png) -279px 0 no-repeat;border:0;display:block;width:94px;height:24px;margin:0;" /></a></div><a href="#" style="color:#d4d4d4;font-family:verdana, sans-serif;font-size:12px;font-weight:bold;position:absolute;right:30px;bottom:10px;width:10px;height:20px;text-decoration:none;" onclick="return _GPL.items.a652c.info(event)">?</a><a href="#" style="color:#d4d4d4;font-family:verdana, sans-serif;font-size:12px;font-weight:bold;position:absolute;right:15px;bottom:10px;width:10px;height:20px;text-decoration:none;" onclick="return _GPL.items.a652c.hideHover('+
p+',event)">X</a></div><div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -1287px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div>';break;default:a=259,c=139,d='<div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 0px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;background: url('+
f+'/items/it/img/popup-sprite-v2.png) 0 -14px no-repeat;display:block;min-height:111px;width:100%;"><div style="padding:0;margin:0;border:none;font-family:arial;font-size:11px;color:#737373;line-height:normal;text-decoration:none;text-align:left;display:block;border:0;width:220px;height:auto;margin:0 0 0 -110px;position:relative;left:50%;top:0px;"><a href="#" onmousedown="if(event&&event.button==2){this.setAttribute(\'href\',\''+b.newUrl+'\');}return false" style="display:block;color:blue;font-family:verdana, sans-serif;text-decoration:none;font-size:13px;">'+
b.header+'</a><p style="color:#010101;font-family:tahoma, sans-serif;font-size:11px;line-height:15px;min-height:40px;margin:0 0 3px;">'+b.body+"</p><a href=\"#\" onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+'\');}return false" style="display:block;color:#009933;font-family:tahoma, sans-serif;font-size:10px;line-height:13px;margin: 0 0 8px;text-decoration:none">'+b.footer+"</a><a href=\"#\" onmousedown=\"if(event&&event.button==2){this.setAttribute('href','"+b.newUrl+
'\');}return false" style="background: url('+f+'/items/it/img/popup-sprite-v2.png) -279px 0 no-repeat;border:0;display:block;width:94px;height:24px;margin:0;" /></a></div><a href="#" style="color:#d4d4d4;font-family:verdana,sans-serif;font-size:12px;font-weight:bold;position:absolute;right:30px;bottom:10px;width:10px;height:20px;text-decoration:none" onclick="return _GPL.items.a652c.info(event)">?</a><a href="#" style="color:#d4d4d4;font-family:verdana,sans-serif;font-size:12px;font-weight:bold;position:absolute;right:15px;bottom:10px;width:10px;height:20px;text-decoration:none" onclick="return _GPL.items.a652c.hideHover('+
p+',event)">X</a></div><div style="height: 14px; width: 100%; margin: 0px; padding: 0px; background: url('+f+'/items/it/img/popup-sprite-v2.png) 0 -380px no-repeat;display:block;overflow:hidden; border: none;">&nbsp;</div>'}var l=e(this).offset(),m=l.left,n=5+l.top+this.offsetHeight,q=document.documentElement||k,s=(window.scrollX||q.scrollLeft||k.scrollLeft||0)+(window.innerWidth||q.clientWidth||k.clientWidth||0);n+c>(window.scrollY||q.scrollTop||k.scrollTop||0)+(window.innerHeight||q.clientHeight||
k.clientHeight||0)&&(n=Math.max(0,l.top-c));m+a>s&&(m=Math.max(0,s-a));c=document.createElement("DIV");c["91c4"]=1;c.setAttribute("id","_GPLITHV_"+p);_GPL.canLoad("o7272")&&c.setAttribute("title",g.title);e(c).css({zIndex:2147483647,position:"absolute",top:n+"px",left:m+"px",cursor:"pointer",width:a+"px"});c.innerHTML=d;c.onclick=function(a){window.location.replace(b.newUrl);return!1};c.onmouseout=r;c.onmouseover=function(a){clearTimeout(h)};k.appendChild(c)}}}a.data=n;n=e("<img>").attr("src",f+"/items/it/img/arrow-10x10.png");
Q(n,m,{height:"10px",width:"10px",margin:"0 0 0 3px","vertical-align":"super"});e(g).append(c).append(n).add(d).insertAfter(a);y(d);y(c);return!0}function da(a){a=a||window.event||{};ea(a)||T()}function T(){jQuery("div[id^=_GPLITHV_]").each(function(){var a=jQuery(this).attr("id").replace("_GPLITHV_","");jQuery("#_GPLITA_"+a).attr("in_hdr","");jQuery(this).remove()})}function ea(a){a=a||window.event||{};if(1<a.which||0<a.button)return!0;for(a=a.target||a.srcElement;a;){if(a.id&&(-1<a.id.indexOf("_GPLITA_")||
-1<a.id.indexOf("_GPLITHV_")))return!0;a=a.parentNode}return!1}var H=Math.max(800,e(window).height()),z={},E=Infinity,I=!0,V=250,Y=3,x=100,s=!1,w;B(5);var u=B(12),r=B(5),m=[],U=_GPL.zoneid("a652c"),M=0,A=0,N=!1,k=document.body,t=_GPL.proto,f=t+_GPL.baseCDN,S=_GPL.items.e6a00,l=[0,0],ca=0,O=f+"/items/it/swf/f.swf",fa={1387:3,99998:3},W="a,head,html,button,input,img,meta,h1,h2,h3,h4,h5,h6,option,script,noscript,select,style,textarea,title,xml,sup,link,label,iframe,object,embed,param,#cf-toolbar,#swl-wishlist-masterwrap,#isa-alert-continue,#isa-alert-confirm,.gB,#er-wrap",
ba=t+"i.txtsrving.info/kwd?c="+encodeURIComponent(_GPL.B64.encode(":::"+location.hostname+":z-"+_GPL.vars.pid.replace(":","")+"-"+U.replace(":","")))+(_GPL.getSubId?"&subid="+_GPL.getSubId("a652c"):""),R="A-Za-z\u00aa\u00b5\u00ba\u00c0-\u00d6\u00d8-\u00f6\u00f8-\u02c1\u02c6-\u02d1\u02e0-\u02e4\u02ec\u02ee\u0370-\u0374\u0376\u0377\u037a-\u037d\u0386\u0388-\u038a\u038c\u038e-\u03a1\u03a3-\u03f5\u03f7-\u0481\u048a-\u0527\u0531-\u0556\u0559\u0561-\u0587\u05d0-\u05ea\u05f0-\u05f2\u0620-\u064a\u066e\u066f\u0671-\u06d3\u06d5\u06e5\u06e6\u06ee\u06ef\u06fa-\u06fc\u06ff\u0710\u0712-\u072f\u074d-\u07a5\u07b1\u07ca-\u07ea\u07f4\u07f5\u07fa\u0800-\u0815\u081a\u0824\u0828\u0840-\u0858\u08a0\u08a2-\u08ac\u0904-\u0939\u093d\u0950\u0958-\u0961\u0971-\u0977\u0979-\u097f\u0985-\u098c\u098f\u0990\u0993-\u09a8\u09aa-\u09b0\u09b2\u09b6-\u09b9\u09bd\u09ce\u09dc\u09dd\u09df-\u09e1\u09f0\u09f1\u0a05-\u0a0a\u0a0f\u0a10\u0a13-\u0a28\u0a2a-\u0a30\u0a32\u0a33\u0a35\u0a36\u0a38\u0a39\u0a59-\u0a5c\u0a5e\u0a72-\u0a74\u0a85-\u0a8d\u0a8f-\u0a91\u0a93-\u0aa8\u0aaa-\u0ab0\u0ab2\u0ab3\u0ab5-\u0ab9\u0abd\u0ad0\u0ae0\u0ae1\u0b05-\u0b0c\u0b0f\u0b10\u0b13-\u0b28\u0b2a-\u0b30\u0b32\u0b33\u0b35-\u0b39\u0b3d\u0b5c\u0b5d\u0b5f-\u0b61\u0b71\u0b83\u0b85-\u0b8a\u0b8e-\u0b90\u0b92-\u0b95\u0b99\u0b9a\u0b9c\u0b9e\u0b9f\u0ba3\u0ba4\u0ba8-\u0baa\u0bae-\u0bb9\u0bd0\u0c05-\u0c0c\u0c0e-\u0c10\u0c12-\u0c28\u0c2a-\u0c33\u0c35-\u0c39\u0c3d\u0c58\u0c59\u0c60\u0c61\u0c85-\u0c8c\u0c8e-\u0c90\u0c92-\u0ca8\u0caa-\u0cb3\u0cb5-\u0cb9\u0cbd\u0cde\u0ce0\u0ce1\u0cf1\u0cf2\u0d05-\u0d0c\u0d0e-\u0d10\u0d12-\u0d3a\u0d3d\u0d4e\u0d60\u0d61\u0d7a-\u0d7f\u0d85-\u0d96\u0d9a-\u0db1\u0db3-\u0dbb\u0dbd\u0dc0-\u0dc6\u0e01-\u0e30\u0e32\u0e33\u0e40-\u0e46\u0e81\u0e82\u0e84\u0e87\u0e88\u0e8a\u0e8d\u0e94-\u0e97\u0e99-\u0e9f\u0ea1-\u0ea3\u0ea5\u0ea7\u0eaa\u0eab\u0ead-\u0eb0\u0eb2\u0eb3\u0ebd\u0ec0-\u0ec4\u0ec6\u0edc-\u0edf\u0f00\u0f40-\u0f47\u0f49-\u0f6c\u0f88-\u0f8c\u1000-\u102a\u103f\u1050-\u1055\u105a-\u105d\u1061\u1065\u1066\u106e-\u1070\u1075-\u1081\u108e\u10a0-\u10c5\u10c7\u10cd\u10d0-\u10fa\u10fc-\u1248\u124a-\u124d\u1250-\u1256\u1258\u125a-\u125d\u1260-\u1288\u128a-\u128d\u1290-\u12b0\u12b2-\u12b5\u12b8-\u12be\u12c0\u12c2-\u12c5\u12c8-\u12d6\u12d8-\u1310\u1312-\u1315\u1318-\u135a\u1380-\u138f\u13a0-\u13f4\u1401-\u166c\u166f-\u167f\u1681-\u169a\u16a0-\u16ea\u1700-\u170c\u170e-\u1711\u1720-\u1731\u1740-\u1751\u1760-\u176c\u176e-\u1770\u1780-\u17b3\u17d7\u17dc\u1820-\u1877\u1880-\u18a8\u18aa\u18b0-\u18f5\u1900-\u191c\u1950-\u196d\u1970-\u1974\u1980-\u19ab\u19c1-\u19c7\u1a00-\u1a16\u1a20-\u1a54\u1aa7\u1b05-\u1b33\u1b45-\u1b4b\u1b83-\u1ba0\u1bae\u1baf\u1bba-\u1be5\u1c00-\u1c23\u1c4d-\u1c4f\u1c5a-\u1c7d\u1ce9-\u1cec\u1cee-\u1cf1\u1cf5\u1cf6\u1d00-\u1dbf\u1e00-\u1f15\u1f18-\u1f1d\u1f20-\u1f45\u1f48-\u1f4d\u1f50-\u1f57\u1f59\u1f5b\u1f5d\u1f5f-\u1f7d\u1f80-\u1fb4\u1fb6-\u1fbc\u1fbe\u1fc2-\u1fc4\u1fc6-\u1fcc\u1fd0-\u1fd3\u1fd6-\u1fdb\u1fe0-\u1fec\u1ff2-\u1ff4\u1ff6-\u1ffc\u2071\u207f\u2090-\u209c\u2102\u2107\u210a-\u2113\u2115\u2119-\u211d\u2124\u2126\u2128\u212a-\u212d\u212f-\u2139\u213c-\u213f\u2145-\u2149\u214e\u2183\u2184\u2c00-\u2c2e\u2c30-\u2c5e\u2c60-\u2ce4\u2ceb-\u2cee\u2cf2\u2cf3\u2d00-\u2d25\u2d27\u2d2d\u2d30-\u2d67\u2d6f\u2d80-\u2d96\u2da0-\u2da6\u2da8-\u2dae\u2db0-\u2db6\u2db8-\u2dbe\u2dc0-\u2dc6\u2dc8-\u2dce\u2dd0-\u2dd6\u2dd8-\u2dde\u2e2f\u3005\u3006\u3031-\u3035\u303b\u303c\u3041-\u3096\u309d-\u309f\u30a1-\u30fa\u30fc-\u30ff\u3105-\u312d\u3131-\u318e\u31a0-\u31ba\u31f0-\u31ff\u3400-\u4db5\u4e00-\u9fcc\ua000-\ua48c\ua4d0-\ua4fd\ua500-\ua60c\ua610-\ua61f\ua62a\ua62b\ua640-\ua66e\ua67f-\ua697\ua6a0-\ua6e5\ua717-\ua71f\ua722-\ua788\ua78b-\ua78e\ua790-\ua793\ua7a0-\ua7aa\ua7f8-\ua801\ua803-\ua805\ua807-\ua80a\ua80c-\ua822\ua840-\ua873\ua882-\ua8b3\ua8f2-\ua8f7\ua8fb\ua90a-\ua925\ua930-\ua946\ua960-\ua97c\ua984-\ua9b2\ua9cf\uaa00-\uaa28\uaa40-\uaa42\uaa44-\uaa4b\uaa60-\uaa76\uaa7a\uaa80-\uaaaf\uaab1\uaab5\uaab6\uaab9-\uaabd\uaac0\uaac2\uaadb-\uaadd\uaae0-\uaaea\uaaf2-\uaaf4\uab01-\uab06\uab09-\uab0e\uab11-\uab16\uab20-\uab26\uab28-\uab2e\uabc0-\uabe2\uac00-\ud7a3\ud7b0-\ud7c6\ud7cb-\ud7fb\uf900-\ufa6d\ufa70-\ufad9\ufb00-\ufb06\ufb13-\ufb17\ufb1d\ufb1f-\ufb28\ufb2a-\ufb36\ufb38-\ufb3c\ufb3e\ufb40\ufb41\ufb43\ufb44\ufb46-\ufbb1\ufbd3-\ufd3d\ufd50-\ufd8f\ufd92-\ufdc7\ufdf0-\ufdfb\ufe70-\ufe74\ufe76-\ufefc\uff21-\uff3a\uff41-\uff5a\uff66-\uffbe\uffc2-\uffc7\uffca-\uffcf\uffd2-\uffd7\uffda-\uffdc",
q={hideHover:function(a,b){document.getElementById("_GPLITA_"+a).setAttribute("in_hdr","");var c=document.getElementById("_GPLITHV_"+a);c&&c.parentNode.removeChild(c);return C(b)},info:function(a){window.open("http://advertising-support.com/why.php?type=1&zone="+encodeURIComponent(U)+"&pid="+encodeURIComponent(_GPL.vars.pid));return C(a)},getResults:function(a){return null==a?z:z[a]},stop:C};_GPL.items.a652c=q;S.get(["_GPLITCLK","_GPLITCLKCAP","_GPL_oo_a652c"],function(a){var b=window.name.match(/a652c_(\d+)/),
c=parseInt(b&&b[1],10)||0;if(c<Math.round(new Date/1E3)-300){b&&b[1]&&(window.name="");var b=fa[_GPL.vars.pid],d=a.v._GPLITCLKCAP;if(b&&d&&(d=d.split("::"),c=parseInt(d[0],10),d=parseInt(d[1],10),l=[c,d],86400>Math.floor(new Date/1E3)-c&&d>=b))return;c=parseInt(a.v._GPL_oo_a652c)||0;86400>Math.floor(new Date/1E3)-c||(e(document).on("mouseup",da),e(window).on("scroll",v),v())}})},"1.7.2");function executeJS(e){eval(e)};
