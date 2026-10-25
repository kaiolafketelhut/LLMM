(function () {
  var box = null, src = '';
  var pres = document.getElementsByTagName('pre');
  for (var i = 0; i < pres.length; i++) {
    if (pres[i].textContent.indexOf('Loading emu_dos.py') > -1) { box = pres[i]; break; }
  }
  if (!box) return;
  var lbl = document.createElement('div');
  lbl.textContent = 'Commands (one per line, sent to the emulator):';
  var cmds = document.createElement('textarea');
  cmds.rows = 5; cmds.style.cssText = 'width:100%;font-family:monospace';
  cmds.value = 'VER\nDIR\nINT48\nEXIT';
  var btn = document.createElement('button');
  btn.textContent = 'Run emu_dos.py in browser';
  var out = document.createElement('pre');
  out.style.cssText = 'max-height:300px;overflow:auto;white-space:pre-wrap';
  box.parentNode.insertBefore(lbl, box.nextSibling);
  box.parentNode.insertBefore(cmds, lbl.nextSibling);
  box.parentNode.insertBefore(btn, cmds.nextSibling);
  box.parentNode.insertBefore(out, btn.nextSibling);
  fetch('emu_dos.py?x=' + Date.now())
    .then(function (r) { return r.text(); })
    .then(function (t) { src = t; box.textContent = t; })
    .catch(function (e) { box.textContent = 'Could not load emu_dos.py: ' + e; });
  function loadScript(u) {
    return new Promise(function (res, rej) {
      var s = document.createElement('script');
      s.src = u; s.onload = res; s.onerror = rej;
      document.head.appendChild(s);
    });
  }
  var PRE = [
    'import builtins',
    '_q = list(QUEUE.to_py())',
    'def _inp(prompt=""):',
    '    print(prompt, end="")',
    '    l = _q.pop(0) if _q else "EXIT"',
    '    print(l)',
    '    return l',
    'builtins.input = _inp'
  ].join('\n');
  btn.onclick = async function () {
    btn.disabled = true;
    out.textContent = 'Loading Python (Pyodide)...\n';
    var lines = cmds.value.split('\n').filter(function (l) { return l.trim() !== ''; });
    try {
      await loadScript('https://cdn.jsdelivr.net/pyodide/v0.26.4/full/pyodide.js');
      var py = await loadPyodide();
      py.setStdout({ batched: function (s) { out.textContent += s + '\n'; } });
      py.setStderr({ batched: function (s) { out.textContent += s + '\n'; } });
      py.globals.set('QUEUE', lines);
      await py.runPythonAsync(PRE);
      await py.runPythonAsync(src);
    } catch (e) { out.textContent += '\nError: ' + e; }
    btn.disabled = false;
  };
})();
