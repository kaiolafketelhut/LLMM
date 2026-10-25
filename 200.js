// fix no blinking cursor - force focus + cursor
var v86_config = {
  bios: { url: "./v86/bios/seabios.bin" },
  vga_bios: { url: "./v86/bios/vgabios.bin" },
  hda: { url: "./v86/images/200.img" },
  autostart: true,
  memory_size: 128 * 1024 * 1024,
  vga_memory_size: 8 * 1024 * 1024,
  filesystem: {},
  acpi: true,
  cmdline: "console=ttyS0"
};

document.addEventListener("DOMContentLoaded", () => {
  var emulator = new V86Starter(v86_config);
  
  // force blinking cursor
  var screen = document.getElementById("screen_container") || document.querySelector("canvas");
  function focusBox() {
    emulator.focus();
    let c = document.querySelector("canvas");
    if(c) c.style.cursor = "text";
  }
  setTimeout(focusBox, 1500);
  document.getElementById("boot_linux_btn")?.addEventListener("click", focusBox);
  document.querySelector(".linux-terminal-box")?.addEventListener("click", focusBox);
});
