/**
 * MULTICOL.js
 * version 1.2
 * Kotaro Imai : HOKYPOKY.(http://hokypoky.info)
 * (c) Licensed GNU General Public License.
 */
(function($){$.fn.extend({multicol:function(a){this.each(function(){var b=parseInt($(this).css("line-height"),10);var c=(a.colNum?a.colNum:2);var l=(a.colMargin?a.colMargin:10);var d=parseInt($(this).width(),10);var g=($(this).width()-l*(c-1))/c-0.1;$(this).find("> *:last").css({marginBottom:0}).end().find("img").each(function(){var i=this.height%b;if(i!=0){i=(i<b/2?-i:b-i)}$(this).css({marginBottom:i})}).end().css({width:g}).end();var k=parseInt($(this).height(),10);var j=(parseInt(k,10)/parseInt(b,10))%parseInt(c,10);if(j!=0){k=k+b*(c-j)}$(this).css({height:k+"px",overflow:"hidden"}).wrapInner("<div class='multicolInner'></div>").end();var h=$(this).html();$(this).css({height:k/c+"px",width:d}).html("").end();for(var f=0;f<c;f++){var e=$(h).css({"float":f!=(c-1)?"left":"right",width:g,marginTop:-($(this).height()*f)+"px",marginRight:f!=(c-1)?l+"px":0+"px",overflow:"hidden"});$(e).appendTo(this)}});$(this).find("*").css("zoom","1");return this}})})(jQuery)
