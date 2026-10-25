(function(){
var css='.workshop{border:1px solid #bbb;border-radius:6px;margin:1.5em 0;overflow:hidden}.workshop-h{background:#eee;padding:.5em .8em;display:flex;flex-wrap:wrap;gap:.4em .9em;align-items:baseline}.workshop-h b{margin-right:auto}.workshop-b{padding:.5em .8em;overflow-x:auto}@media(prefers-color-scheme:dark){.workshop{border-color:#555}.workshop-h{background:#2a2a2a}}';
var R='https://github.com/Colegio-San-Caio/demo-repository/releases/download/v1.0/';
function lca(n){var p=n[0].parentElement;while(p&&!n.every(function(x){return p.contains(x)}))p=p.parentElement;return p;}
function build(){
 if(document.querySelector('.workshop'))return true;
 var as=[].slice.call(document.querySelectorAll('a')).filter(function(a){return a.textContent.trim()==='releases'});
 if(as.length<2)return false;
 var c=lca(as);
 if(!c||c===document.body||c===document.documentElement)return false;
 var s=document.createElement('style');s.textContent=css;document.head.appendChild(s);
 var b=document.createElement('div');b.className='workshop';
 b.innerHTML='<div class="workshop-h"><b>Workshop</b><a href="'+R+'workshop.img">X: workshop.img</a><a href="'+R+'fily.img">fily.img</a><a href="workshop/hexdiff_unix_specification.pdf">hexdiff spec (PDF)</a></div><div class="workshop-b"></div>';
 c.parentNode.insertBefore(b,c);b.lastChild.appendChild(c);
 return true;
}
if(!build()){var o=new MutationObserver(function(){if(build())o.disconnect()});o.observe(document.body,{childList:true,subtree:true});}
})();
