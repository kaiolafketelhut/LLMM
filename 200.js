var v86_config={
 bios:{url:"./v86/bios/seabios.bin"},
 vga_bios:{url:"./v86/bios/vgabios.bin"},
 hda:{url:"./v86/images/200.img"},
 autostart:true,
 memory_size:128*1024*1024,
 wasm_path:"./v86/build/v86.wasm"
};
document.addEventListener("DOMContentLoaded",()=>{
  window.emulator=new V86Starter(v86_config);
  setTimeout(()=>{try{emulator.focus()}catch(e){}},1200);
});

window.sendBluh=function(){
  emulator.keyboard_send_text("cat > /bin/bluh <<'EOF'\n#!/bin/sh\necho \"bluh $@\"\nEOF\nchmod +x /bin/bluh\nclear\nbluh ready\n");
};
document.addEventListener("DOMContentLoaded",()=>{ setTimeout(()=>{try{sendBluh()}catch(e){}},25000); });
