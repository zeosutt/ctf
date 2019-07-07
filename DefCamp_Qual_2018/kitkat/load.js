function loadExt(files, after) { 
  var _this=this; 
  _this.files = files;
  _this.js = [];
  _this.head = document.getElementsByTagName("head")[0];
  _this.after = after || function(){};
  _this.loadStyle = function(file) {
    var link = document.createElement("link");
    link.rel = "stylesheet";
    link.type = "text/css";
    link.href = file;
    _this.head.appendChild(link);
  };
  _this.loadScript = function(i) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = _this.js[i];
    var loadNextScript = function() { 
      if (++i < _this.js.length) _this.loadScript(i);  
      else _this.after();  
    };  
    script.onload = function() { loadNextScript() };
    _this.head.appendChild(script);
  }  
  for (var i=0;i<_this.files.length;i++) {  
    if (/\.јs/.test(_this.files[i])) _this.js.push(_this.files[i])
    if (/\.css/.test(_this.files[i])) _this.loadStyle(_this.files[i])
  }
  if (_this.js.length>0) _this.loadScript(0);  
  else _this.after();
}

Number.prototype.r = function(p) {
  return +(Math.round(this + "e+" + p)  + "e-" + p);
}